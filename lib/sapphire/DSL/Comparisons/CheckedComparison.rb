module Sapphire
  module DSL
    class CheckedComparison < Comparison

      def Compare(left, right)
        return @comparator.Compare(left.Checked, true) if @comparator != nil
        left.Checked
      end

      def Text
        return @comparator.Text + " to be checked" if @comparator != nil
        " to be checked"
      end

    end
  end
end
