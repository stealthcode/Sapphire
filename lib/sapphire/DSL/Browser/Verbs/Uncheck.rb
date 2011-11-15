module Sapphire
  module DSL
    module Browser
      def Uncheck(item)
        item.With(:page => @page)
        item.Uncheck
      end
    end
  end
end

