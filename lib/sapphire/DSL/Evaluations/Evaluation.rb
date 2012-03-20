module Sapphire
  module DSL
    class Evaluation

      attr_accessor :left
      attr_accessor :right

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
        self.Output()
      end

      def Evaluate()
        Compare(@left, @right)
      end

      def Output()

        if(!Compare(@left, @right))
          messages = []

          messages << "expected" + @comparator.Text + ": (nil)" if @right == nil
          messages << "expected" + @comparator.Text + ": " + @right.to_s if @right != nil
          messages << "got: (nil)" if @left == nil
          messages << "got: " + @left.to_s if @left != nil

          raise ExpectationException.new(messages)
        end

      end
    end
  end
end