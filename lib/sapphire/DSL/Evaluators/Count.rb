module Sapphire
  module DSL
    module Browser
      def Count(item)
        EqualsComparison.new(Count.new(item))
      end

      class Count < Evaluator
        def execute
          @item.Count(@item, @comparator)
        end
      end
    end
  end
end