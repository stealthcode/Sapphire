module Sapphire
  module DSL
    class DifferComparison < Comparison

      def Compare(left, right)
        return @comparator.Compare((right == left), true) if @comparator != nil
        right == left
      end

      def Text
        return @comparator.Text + "" if @comparator != nil
        ""
      end

    end
  end
end
