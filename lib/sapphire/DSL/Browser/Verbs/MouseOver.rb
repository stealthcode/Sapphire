module Sapphire
  module DSL
    module Browser
      def MouseOver(item)
        item.With(:page => $page)
        item.MouseOver
      end
    end
  end
end

