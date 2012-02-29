module Sapphire
  module WebAbstractions
    class List < Control

      def initialize(hash)
        @hash = hash
        @retryAttempts = 0
      end

      def Equals(value, comparator)
        x = self.FindAll
        x.each do |item|
          if comparator.Compare(item.text, value)
            return  EqualsComparison.new(Evaluation.new(item.text, value))
          end
        end

        #if here then it couldnt make a match, build up the list of values
        alltext = []
        x.each do |item|
          alltext << item.text
        end

        return  EqualsComparison.new(Evaluation.new(alltext, value))
      end

      def In(values, comparator)
        x = self.FindAll
        x.each do |item|
          values.each do |value|
            if comparator.Compare(item.text, value)
              return Evaluation.new(item.text, value)
            end
          end
        end

        #if here then it couldnt make a match, build up the list of values
        alltext = []
        x.each do |item|
          alltext << item.text
        end

        return Evaluation.new(values, alltext)
      end

      def Contain(value)
        x = self.FindAll
        x.each do |item|
          if item.text.include? value
            return ContainsComparison.new(Evaluation.new(value, item.text))
          end
        end

        return Evaluation.new("Value not found in list", value)
      end

      def Click
        wait = Selenium::WebDriver::Wait.new(:timeout => 3)
        begin
          clicked = wait.until { items = self.FindAll
            if items.empty? == false
              if items.first.displayed? == true
                items.first.click
                return true
              end
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
        return Evaluation.new(items.count, value)
      end

      def Text
        values = []
        x = self.FindAll
        x.each do |item|
          values << item.text
        end

        return values
      end

    end
  end
end
