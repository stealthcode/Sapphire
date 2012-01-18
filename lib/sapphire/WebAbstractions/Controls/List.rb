module Sapphire
  module WebAbstractions
    class List < Control

      def initialize(hash)
        @hash = hash
        @retryAttempts = 0
      end

      def Equals(value)
        x = self.FindAll
        x.each do |item|
          if item.text == value
            return Evaluation.new(item.text, value)
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

      def Count
        items = self.FindAll
        return items.count
      end
    end
  end
end
