module Sapphire
  module DSL
    module Browser
      def Check(item)
        item.With(:page => $page)
        item.Check
      end
    end
  end
end

