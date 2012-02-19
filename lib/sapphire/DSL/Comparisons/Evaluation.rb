module Sapphire
  module DSL
    class Evaluation

      attr_reader :left
      attr_reader :right

      def initialize(left, right)
        @left = left
        @right = right
      end

      def Compare(left, right)
        return @comparator.Compare(left, right) if @comparator != nil
        EqualsComparison.new(self).Compare(left, right) if @comparator == nil
      end

      def CompareWith(item)
        @comparator = item
      end

      def execute()
        self.Evaluate()
      end

      def Evaluate()

        if(!Compare(@left, @right))
          messages = []

          messages << "expected" + @comparator.Text + ": (nil)" if @left == nil
          messages << "expected" + @comparator.Text + ": " + @left.to_s if @left != nil
          messages << "got: (nil)" if @right == nil
          messages << "got: " + @right.to_s if @right != nil

          raise ExpectationException.new(messages)
        end

      end
    end
  end
end