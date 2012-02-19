module Sapphire
  module DSL
    class EqualsComparison < Comparison

      def Compare(left, right)
        return @comparator.Compare(left == right, true) if @comparator != nil
        left == right
      end

      def Text
        ""
      end

    end
  end
end
