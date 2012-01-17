module Sapphire
  module WebAbstractions
    class List < Control

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
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
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
          return nil
        end
      end

      def Count
        items = self.FindAll
        return items.count
      end
    end
  end
end
