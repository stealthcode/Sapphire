module Sapphire
  module DSL
    module Browser
      def Count(item)
        EqualsModifier.new(Count.new(item))
      end

      class Count
        def initialize(item)
          @item = item
        end

        def ModifyWith(item)
          @modifier = item
        end

        def execute
          return { :value => @item.Count(@item, modifier), :modifier => @modifier }
        end
      end
    end
  end
end