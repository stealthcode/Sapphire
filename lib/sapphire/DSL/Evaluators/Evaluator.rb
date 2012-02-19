module Sapphire
  module DSL
    class Evaluator
      def initialize(item)
        @item = item
      end

      def CompareWith(comparator)
        @comparator = comparator
        @item = comparator.Create(@item)
      end
    end
  end
end

