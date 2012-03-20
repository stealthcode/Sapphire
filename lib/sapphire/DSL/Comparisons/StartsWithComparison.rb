module Sapphire
  module DSL
    class StartsWithComparison < Comparison

      def Compare(left, right)
        return @comparator.Compare((left.start_with? right), true) if @comparator != nil
        left.start_with? right
      end

      def Text
        return @comparator.Text if @comparator != nil
        ""
      end

    end
  end
end
