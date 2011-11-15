module Sapphire
  module DSL
    module Browser
      def Click(item)
        item.With(:page => @page)
        item.Click
      end
    end
  end
end

