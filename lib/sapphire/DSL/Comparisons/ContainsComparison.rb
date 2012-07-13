module Sapphire
  module DSL
    class ContainsComparison < Comparison

      def Compare(actual, expected)
        return @comparator.Compare((actual.include? expected), true) if @comparator != nil
        actual.include? expected
      end

      def Text
        return @comparator.Text + " to contain" if @comparator != nil
        " to contain"
      end

    end
  end
end
