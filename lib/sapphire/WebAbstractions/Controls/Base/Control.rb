module Sapphire
  module WebAbstractions
    class Control
      def initialize(hash)
        @hash = hash
      end

      def Find(comparator = nil)
        $driver.FindItem(@hash, comparator)
      end

      def FindAll
        $driver.FindAllItems(@hash)
      end

      def FindWithoutWait
        $driver.FindElement @hash[0].keys.first, @hash[0].fetch(@hash[0].keys.first)
      end

      def Text
        text = self.Find
        text.text
      end

      def Click
        control = self.Find
        control.click
      end

      def MouseOver
        if @hash.is_a? Hash
          if(@hash.has_key?(:id))
            $driver.ExecuteScript("document.getElementById('"+ @hash.fetch(:id) +"').style.visibility = 'visible'; ")
          elsif (@hash.has_key?(:name))
            $driver.ExecuteScript("document.getElementByName('"+ @hash.fetch(:name) +"').style.visibility = 'visible'; ")
          elsif (@hash.has_key?(:xpath))
            $driver.ExecuteScript("document.evaluate( '" + @hash.fetch(:xpath) + "', document, null, XPathResult.ANY_TYPE, null ).iterateNext().style.visibility = 'visible'; ")
          end
        elsif @hash.is_a? Array
          if(@hash[0].has_key?(:id))
            $driver.ExecuteScript("document.getElementById('"+ @hash[0].fetch(:id) +"').style.visibility = 'visible'; ")
          elsif (@hash[0].has_key?(:name))
            $driver.ExecuteScript("document.getElementByName('"+ @hash[0].fetch(:name) +"').style.visibility = 'visible'; ")
          elsif (@hash[0].has_key?(:xpath))
            $driver.ExecuteScript("document.evaluate( '" + @hash[0].fetch(:xpath) + "', document, null, XPathResult.ANY_TYPE, null ).iterateNext().style.visibility = 'visible'; ")
          end
        end

        sleep(1)
      end

      def Visible(shouldWait = true)
        control = self.Find if shouldWait
        control = self.FindWithoutWait if !shouldWait
        Evaluation.new(control.displayed?, true)
      end

      def Equals(value, comparator)
        evaluation = Evaluation.new(self.Text, value)
        EqualsComparison.new(evaluation)
      end

      def Contain(value)
        return ContainsComparison.new(Evaluation.new(value, self.Text))
      end

      def In(values, comparator)
        text = self.Text
        values.each do |value|
          if comparator.Compare(text, value)
            return Evaluation.new(text, value)
          end
        end

        #error land
        return Evaluation.new(text, values)
      end

      def Evaluate(key, arg, comparator, block)

        value = GetValue(arg, key)
        timeout = GetValue(arg, :wait)
        timeout ||= 5

        begin
          value = value.Text if value.is_a? Control
          evaluation = block.call(self, value)

          wait = Selenium::WebDriver::Wait.new(:timeout => timeout)
            result = wait.until {
              evaluation = block.call(self, value)
              y = evaluation.Evaluate()
              comparator = EqualsComparison.new(evaluation) if evaluation == nil
              evaluation if comparator.Compare(y == true, true)
            }

          return result
        rescue
          return Evaluation.new(evaluation.left, evaluation.right)
        end
      end

      def GetValue(item, key)

        if item.is_a? Array
          item.each do |sub_item|
            value = GetValue(sub_item, key)
            return value if !value.nil?
          end
        end

        if item.is_a? Hash
          return Substitute(key) if Parameters.instance.Contains(key)
          return Substitute(item[key]) if item.has_key? key
        end

        return Parameter(key) if Parameters.instance.Contains(key)

        nil
      end

      def Substitute(item)

        return $page.Get(item) if $page.Contains(item)
        return Parameter(item) if Parameters.instance.Contains(item)

        return item
      end

    end
  end
end

