module Sapphire
  module DSL
    module Data
      def Validate(hash)
        NullModifier.new(Validate.new(hash))
      end

      class Validate
        def initialize(item)
          @item = item
        end

        def ModifyWith(item)
          @modifier = item
        end

        def execute
          return { :value => @item.Validate(@item), :modifier => @modifier }
        end
      end
    end
  end
end

