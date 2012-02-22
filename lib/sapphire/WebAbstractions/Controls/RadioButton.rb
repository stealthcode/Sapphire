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
        return val != nil
      end

      def Visible
        radio = self.Find
        return radio.displayed?
      end

    end
  end
end

