module Sapphire
  module DSL
    class ContainsComparison < Comparison

      def Compare(left, right)
        return @comparator.Compare((right.include? left), true) if @comparator != nil
        right.include? left
      end

      def Text
        return @comparator.Text + " to contain" if @comparator != nil
        " to contain"
      end

    end
  end
end
