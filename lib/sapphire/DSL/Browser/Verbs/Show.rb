module Sapphire
  module DSL
    module Browser
      def Show(item)
        EqualsModifier.new(Show.new(item))
      end

      class Show
        def initialize(item)
          @item = item
        end

        def ModifyWith(item)
          @modifier = item
        end

        def execute
          return { :value => @item.Show(@item, @modifier), :modifier => @modifier }
        end
      end
    end
  end
end

