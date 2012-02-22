module Sapphire
  module DSL
    class Evaluator
      def initialize(item, &block)
        @item = item
        @block = block
      end

      def CompareWith(comparator)
        @comparator = comparator
        @item = comparator.Create(@item)
      end

      def execute
        @comparator = EqualsComparison.new(@item) if @comparator == nil
        @block.call(@item, @comparator)
      end

    end
  end
end

