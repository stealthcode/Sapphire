module Sapphire
  module WebAbstractions
    class List < Control

      def initialize(hash)
        @retryAttempts = 0
        super hash
      end

      def Equals(value, comparator)
        x = self.FindAll
        x.each do |item|
          if comparator.Compare(item.Text, value)
            return  EqualsComparison.new(ControlEvaluation.new(item.Text, value, item))
          end
        end

        #if here then it couldnt make a match, build up the list of values
        alltext = []
        x.each do |item|
          alltext << item.Text
        end

        return EqualsComparison.new(ControlEvaluation.new(alltext, value, self))
      end

      def In(values, comparator)
        x = self.FindAll
        x.each do |item|
          values.each do |value|
            if comparator.Compare(item.Text, value)
              return ControlEvaluation.new(item.Text, value, item)
            end
          end
        end

        #if here then it couldnt make a match, build up the list of values
        alltext = []
        x.each do |item|
          alltext << item.Text
        end

        return ControlEvaluation.new(values, alltext, self)
      end

      def Contain(expected_text)
        text = self.Text
        text.each do |t|
          if t.include? expected_text
            return ContainsComparison.new(ControlEvaluation.new(t, expected_text, nil))
          end
        end

        return ControlEvaluation.new("Value not found in list", expected_text, self)
      end

      def Click
        wait = Selenium::WebDriver::Wait.new(:timeout => 20)
        begin
          clicked = wait.until { items = self.FindAll
          if !items.empty? && items.first.Visible && items.first.IsEditable
            items.first.Click
            return true
          end
          }
          return nil
        rescue
          #retry a few times because in strange events from finding all the elements to trying to click one, it can become
          #unavailable
          if(@retryAttempts < 2)
            @retryAttempts = @retryAttempts + 1
            self.Click
          else
            return nil
          end
        end
      end

      def Count(value)
        items = self.FindAll
        return ControlEvaluation.new(items.count, value, self)
      end

      def Text
        values = []
        x = self.FindAll
        x.each do |item|
          values << item.control.text
        end

        return values
      end

    end
  end
end
