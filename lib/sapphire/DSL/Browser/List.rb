module Sapphire
  module WebAbstractions
    class List < Control

      def Equals(value)
        x = self.FindAll
        x.each do |item|
          return true if item.text == value
        end
      end

    end
  end
end