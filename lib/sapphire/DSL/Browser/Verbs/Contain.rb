module Sapphire
  module DSL
    module Browser
      def Contain(item)
        ContainsModifier.new(Contain.new(item))
      end

      class Contain
        def initialize(item)
          @item = item
        end

        def ModifyWith(item)
          @modifier = item
        end

        def execute
          return { :value => @item.Contain(@item, @modifier), :modifier => @modifier }
        end
      end
    end
  end
end

