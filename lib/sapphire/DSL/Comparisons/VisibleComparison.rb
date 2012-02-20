module Sapphire
  module DSL
    class VisibleComparison < Comparison

      def Compare(left, right)
        return @comparator.Compare(left.Visible, true) if @comparator != nil
        left.Visible
      end

      def Text
        return @comparator.Text + " to be visible" if @comparator != nil
        " to be visible"
      end

    end
  end
end
