module Sapphire
  module WebAbstractions
    class Control

      attr_accessor :found_by_type
      attr_accessor :found_by_value
      attr_accessor :control

      def initialize(args)
        return if args.nil?
        @array = args

        if args.is_a? Hash
          @control = args.fetch :instance if args.has_key? :instance
          @found_by_type = args.keys.first
          @found_by_value = args.fetch(args.keys.first)
        end
      end

      def Find(comparator = nil)
        @control, @found_by_type, @found_by_value = $driver.FindItemWithWait(@array, comparator)
        @control
      end

      def FindAll
        items, @found_by_type, @found_by_value = $driver.FindAllItems(@array)
        list = []
        items.each do |item|
          hash = {@found_by_type => @found_by_value, :instance => item}
          list << Control.new(hash)
        end

        list
      end

      def FindWithoutWait(comparator = nil)
        @control, @found_by_type, @found_by_value = $driver.FindItemWithoutWait(@array, comparator)
        @control
      end

      def Text
        text = self.Find
        text.text
      end

      def Click
        self.Find if @control.nil?
        @control.click
      end

      def MouseOver
        self.Find
        if(@found_by_type == :id)
          $driver.ExecuteScript("document.getElementById('"+ @found_by_value +"').style.visibility = 'visible'; ")
        elsif (@found_by_type == :name)
          $driver.ExecuteScript("document.getElementByName('"+ @found_by_value +"').style.visibility = 'visible'; ")
        elsif (@found_by_type == :xpath)
          $driver.ExecuteScript("document.evaluate( '" + @found_by_value + "', document, null, XPathResult.ANY_TYPE, null ).iterateNext().style.visibility = 'visible'; ")
        end

        sleep(1)
      end

      def IsEditable
        control = self.Find
        if (!control.nil?)
          ControlEvaluation.new(control["disabled"], false, self)
        end
      end

      def Visible(shouldWait = true)
        control = self.Find if shouldWait
        control = self.FindWithoutWait if !shouldWait
        if (!control.nil?)
          ControlEvaluation.new(control.displayed?, true, self)
        end
      end

      def Equals(value, comparator)
        evaluation = ControlEvaluation.new(self.Text, value, self)
        EqualsComparison.new(evaluation)
      end

      def Contain(expected_value)
        return ContainsComparison.new(ControlEvaluation.new(self.Text, expected_value, self))
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
          puts $!.backtrace if !$verbose.nil?
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

