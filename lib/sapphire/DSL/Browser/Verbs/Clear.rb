module Sapphire
  module DSL
    module Browser
      def Clear(item)
        if(item.is_a? Class)
          x = item.new
          x.Clear
          return
        end
      end
    end
  end
end