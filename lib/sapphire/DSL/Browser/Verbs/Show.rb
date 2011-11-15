module Sapphire
  module DSL
    module Browser
      def Show(item)
        NullModifier.new(Show.new(item, @page))
      end

      class Show
        def initialize(item, page)
          @item = item
          @page = page
        end

        def ModifyWith(item)
          @modifier = item
        end

        def execute
          return { :value => SapphireConfig.Current.GetBy(@item.class).new(@page).Show(@item, @modifier), :modifier => @modifier }
        end
      end
    end
  end
end

