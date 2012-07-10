module Sapphire
  module WebAbstractions
    class TextBox < Control

      def Text= (value)
        textBox = self.Find
        textBox.send_keys value
      end

      def Text
        textBox = self.Find
        textBox.attribute("value")
      end

      def Set(value)
        if(value == "")
          self.Clear
        else
          textBox = self.Find
          readonly = textBox.attribute("readonly")
          if readonly == "false" or readonly.nil?
            textBox.clear
          end
          textBox.send_keys value
        end
      end

      def Clear
        textBox = self.Find
        textBox.clear
      end

    end
  end
end

