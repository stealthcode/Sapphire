module Sapphire
  module WebAbstractions
    class DropDown < Control
      def Selected= (value)
        Set(value)
      end

      def Selected
        text = self.Find
        text.value
      end

      def Text
        text = self.Find
        text.attribute("value")
      end

      def Set(value)
        text = self.Find
        options = text.find_elements(:tag_name, "option")
        selection = options.find{|o| o.text == value.to_s}
        raise "could not find the value " + value.to_s if selection.nil?
        selection.click
      end
    end
  end
end