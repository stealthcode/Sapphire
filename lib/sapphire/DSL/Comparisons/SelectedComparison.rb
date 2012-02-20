module Sapphire
  module DSL
    class SelectedComparison < Comparison

      def Compare(left, right)
        return @comparator.Compare(left.Selected, true) if @comparator != nil
        left.Selected
      end

      def Text
        return @comparator.Text + " to be selected" if @comparator != nil
        " to be selected"
      end

    end
  end
end
