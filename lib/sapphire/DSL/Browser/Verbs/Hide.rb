module Sapphire
  module DSL
    module Browser
      def Hide(args)
        NullModifier.new(Hide.new(args, @page))
      end

      class Hide
        def initialize(item, page)
          @item = item
          @page = page
        end

        def ModifyWith(item)
          @modifier = item
        end

        def execute
          return { :value => SapphireConfig.Current.GetBy(@item.class).new(@page).Hide(@item, @modifier), :modifier => @modifier }
        end
      end
    end
  end
end

