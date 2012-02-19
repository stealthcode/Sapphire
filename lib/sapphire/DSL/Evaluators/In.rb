module Sapphire
  module DSL
    module Browser
      def In(item)
        EqualsComparison.new(In.new(item))
      end

      class In < Evaluator
        def execute
         @item.In(@item, @comparator)
        end
      end
    end
  end
end

