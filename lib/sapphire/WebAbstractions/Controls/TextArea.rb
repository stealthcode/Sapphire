module Sapphire
  module WebAbstractions
    class TextArea < Control

      def Text
        textarea = self.Find
        textarea.attribute("value")
      end

      def Set(value)
        if(value == "")
          self.Clear
        else
          textarea = self.Find
          readonly = textarea.attribute("readonly")
          if readonly == "false"
            textarea.clear
          end
          textarea.send_keys value
        end
      end

      def Clear
        textarea = self.Find
        textarea.clear
      end

    end
  end
end

