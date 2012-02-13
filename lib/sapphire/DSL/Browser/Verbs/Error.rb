module Sapphire
  module DSL
    module Browser
      def Error(hash)
        NullModifier.new(Error.new(hash))
      end

      class Error
        def initialize(item)
          @item = item
        end

        def ModifyWith(item)
          @modifier = item
        end

        def execute
           return { :value => @item.Error(@item), :modifier => @modifier }
        end
      end
    end
  end
end

