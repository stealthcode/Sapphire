module Sapphire
  module DSL
    class VisibleComparison < Comparison

      def Compare(left, right)
        return @comparator.Compare(left.displayed?, true) if @comparator != nil
        left.displayed?
      end

      def Text
        return @comparator.Text + " to be visible" if @comparator != nil
        " to be visible"
      end

    end
  end
end
