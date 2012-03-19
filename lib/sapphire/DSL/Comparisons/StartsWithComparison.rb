module Sapphire
  module DSL
    class StartsWithComparison < Comparison

      def Compare(left, right)
        return @comparator.Compare((right.start_with? left), true) if @comparator != nil
        right.start_with? left
      end

      def Text
        return @comparator.Text if @comparator != nil
        ""
      end

    end
  end
end
