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
        return val
      end

      def Visible
        radio = self.Find
        val = radio.attribute("disabled")
        puts val.inspect
        x = val == false
        x = x and radio.displayed?
        return x
      end

    end
  end
end

