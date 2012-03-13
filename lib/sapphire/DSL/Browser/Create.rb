module Sapphire
  module DSL
    module Browser
      def Create(item, &block)
        item.Create(item) do block.call end
      end
    end
  end
end

