module Sapphire
  module DSL
    module Browser
      def In(item)
        EqualsModifier.new(In.new(item, @page))
      end

      class In
        def initialize(item, page)
          @item = item
          @page = page
        end

        def ModifyWith(item)
          @modifier = item
        end

        def execute
          return { :value => @item.In(@item, modifier), :modifier => @modifier }
        end
      end
    end
  end
end

