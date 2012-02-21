module Sapphire
  module WebAbstractions
    class CheckBox < Control
       def Check (value)
        checked = self.Checked

        if value && checked
          return;
        end

        if !value && !checked
          return;
        end

        self.Click
      end

      def Checked
        radio = self.Find
        radio.attribute("checked")
      end

      def Clear
        self.Check false
      end
    end
  end
end

