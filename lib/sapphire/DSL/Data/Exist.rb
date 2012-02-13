module Sapphire
  module DSL
    module Data
      def Exist(value)
        Not(Exist.new(value))
      end

      class Exist
        def initialize(item)
          @item = item
        end

        def ModifyWith(item)
          @modifier = item
        end

        def execute
          return { :value => @item.Exist(@item), :modifier => @modifier }
        end
      end
    end
  end
end


