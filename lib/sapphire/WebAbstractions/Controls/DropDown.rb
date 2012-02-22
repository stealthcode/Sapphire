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
        val = text.attribute("value")
        options = text.find_elements(:tag_name, "option")
        selection = options.find{|o| o.attribute("value") == val.to_s}
        selection.text
      end

      def Set(value)
        text = self.Find
        options = text.find_elements(:tag_name, "option")
        selection = options.find{|o| o.text == value.to_s}
        raise "could not find the value " + value.to_s if selection.nil?
        selection.click
      end

      def Contain(value)
        ddl = self.Find
        items = ddl.find_elements(:tag_name, "option")
        items.each do |item|
          if item.text == value
            return Evaluation.new(item.text, value)
          end
        end

        return Evaluation.new("Value not found in list", value)
      end

      def Count(value)
        ddl = self.Find
        items = ddl.find_elements(:tag_name, "option")
        return Evaluation.new(items.count, value)
      end

      def Clear
        @hash.each do |item|
          if item.has_key? :default
            self.Set(item[:default])
            return
          end
        end

        raise "no :default set for DropDown"
      end

    end
  end
end