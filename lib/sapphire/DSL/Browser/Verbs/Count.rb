module Sapphire
  module DSL
    module Browser
      def Count(item)
        NullModifier.new(Count.new(item, @page))
      end

      class Count
        def initialize(item, page)
          @item = item
          @page = page
        end

        def ModifyWith(item)
          @modifier = item
        end

        def execute
          return { :value => SapphireConfig.Current.GetBy(@item.class).new(@page).Count(@item, @modifier), :modifier => @modifier }
        end
      end
    end
  end
end