module Sapphire
  module DSL
    module Browser
      def Using(item, &block)
        item.Using(item) do block.call end
      end
    end
  end
end

