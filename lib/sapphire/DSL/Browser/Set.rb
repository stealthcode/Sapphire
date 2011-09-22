module Sapphire
  module DSL
    module Browser
      def Set(hash)
        if(hash.keys.first == AlertBox)
          text = hash[item.keys.first]
          klass = hash.keys.first.new
          klass.Set text
        else
          ExecuteHashAgainstControl(hash, @page) do |control, arg|
            control.Set arg
          end
        end
      end
    end
  end
end

