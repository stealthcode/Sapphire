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
    end
  end
end
