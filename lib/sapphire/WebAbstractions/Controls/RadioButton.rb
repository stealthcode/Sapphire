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
        return ControlEvaluation.new(val != nil, true, self)
      end

      def Visible(*should_wait)
        radio = self.Find
        x = radio.attribute("disabled")
        ControlEvaluation.new((x == "false" || x.nil?), true, self)
      end

    end
  end
end

