module Sapphire
  module WebAbstractions
    class Control

      attr_reader :found_by_type
      attr_reader :found_by_value

      def initialize(args)
        return if args.nil?

        hash = {}
        hash = args if args.is_a? Hash

        args.each do |item|
          hash.merge! item if item.is_a? Hash
        end if args.is_a? Array

        @hash = hash
        @by = hash.keys.first
        @value = hash[hash.keys.first]
        @control = hash.fetch :instance if hash.has_key? :instance

        @found_by_type = @by
        @found_by_value = @value
      end

      def Find(comparator = nil)
        @control ||= $driver.FindItemWithWait(@by, @value, comparator)
        @control
      end

      def FindAll
        items = $driver.FindAllItems(@by, @value)
        list = []
        items.each do |item|
          hash = {@by => @value, :instance => item}
          list << Control.new(hash)
        end

        list
      end

      def FindWithoutWait(comparator = nil)
        $driver.FindItemWithoutWait(@by, @value, comparator)
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
        if(@by == :id)
          $driver.ExecuteScript("document.getElementById('"+ @value +"').style.visibility = 'visible'; ")
        elsif (@by == :name)
          $driver.ExecuteScript("document.getElementByName('"+ @value +"').style.visibility = 'visible'; ")
        elsif (@by == :xpath)
          $driver.ExecuteScript("document.evaluate( '" + @value + "', document, null, XPathResult.ANY_TYPE, null ).iterateNext().style.visibility = 'visible'; ")
        end

        sleep(1)
      end

      def Visible(shouldWait = true)
        control = self.Find if shouldWait
        control = self.FindWithoutWait if !shouldWait
        ControlEvaluation.new(control.displayed?, true, self)
      end

      def Equals(value, comparator)
        evaluation = ControlEvaluation.new(self.Text, value, self)
        EqualsComparison.new(evaluation)
      end

      def Contain(value)
        return ContainsComparison.new(ControlEvaluation.new(value, self.Text, self))
      end

      def In(values, comparator)
        text = self.Text
        values.each do |value|
          if comparator.Compare(text, value)
            return ControlEvaluation.new(text, value, self)
          end
        end

        #error land
        return ControlEvaluation.new(text, values, self)
      end

      def Evaluate(key, arg, comparator, block)

        value = GetValue(arg, key)
        timeout = GetValue(arg, :wait)
        timeout ||= 20

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
          return ControlEvaluation.new(evaluation.left, evaluation.right, self)
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

