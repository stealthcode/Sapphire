module Sapphire
  module DSL
    module Browser
      def Error(hash)
        EqualsModifier.new(Error.new(hash))
      end

      class Error
        def initialize(item)
          @item = item
        end

        def ModifyWith(item)
          @modifier = item
        end

        def execute
           return { :value => @item.Error(@item, @modifier), :modifier => @modifier }
        end
      end
    end
  end
end

