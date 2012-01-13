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
        items = self.FindAll
        if items.empty? == false
          items.first.click
        end
      end

      def Count(count)
        items = self.FindAll
        return Evaluation.new(items.count, count)
      end
    end
  end
end
