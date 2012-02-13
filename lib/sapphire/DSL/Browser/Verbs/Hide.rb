module Sapphire
  module DSL
    module Browser
      def Hide(args)
        NullModifier.new(Hide.new(args))
      end

      class Hide
        def initialize(item)
          @item = item
        end

        def ModifyWith(item)
          @modifier = item
        end

        def execute
          return { :value => @item.Hide(@item, @modifier), :modifier => @modifier }
        end
      end
    end
  end
end

