module Sapphire
  module WebAbstractions
    class RadioButton < Control

      def Text
        self.Find().text
      end

      def Check (value)
        radio = self.Find
        radio.click
      end

      def Selected
        radio = self.Find
        val = radio.attribute("selected")
        return Evaluation.new(val != nil, true)
      end

      def Visible
        radio = self.Find
        x = radio.attribute("disabled")
        Evaluation.new((x == "false"), true)
      end

    end
  end
end

