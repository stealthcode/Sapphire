module Sapphire
  module DSL
    module Browser
      def ExecuteHashAgainstControl(hash, page, &block)
        hash.keys.each do |key|
          page.fields.each do |field|
            field.keys.each do |field_key|
              if(field_key == key)
                block.call(field[field_key], hash[key])
                return
              end
            end
          end
        end

        raise "cannot find control matching " + hash.to_s + " for page " + @page.to_s
      end

      def ExecuteAgainstControl(item, page, &block)
        page.fields.each do |field|
          field.keys.each do |field_key|
            if(field_key == item)
              block.call(field[field_key], item)
              return
            end
          end
        end

        raise "Cannot find controls matching: " + item + "for page " + @page.to_s
      end
    end
  end
end

