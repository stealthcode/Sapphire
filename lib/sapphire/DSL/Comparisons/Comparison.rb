module Sapphire
  module DSL
    class Comparison

      attr_reader :item

      def initialize(item)
        @item = item
        @item.CompareWith(self) if @item.is_a? Evaluation or @item.is_a? Evaluator or @item.is_a? Comparison
      end

      def CompareWith(item)
        @comparator = item
      end

      def Create(item)
        return self.class.new(item) if item.is_a? Comparison or item.is_a? Evaluation
        item
      end

      def Evaluate()
        self.execute
      end

      def execute
        @item.execute
      end
    end
  end
end
