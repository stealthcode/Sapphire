module Sapphire
  module DSL
    def Not(item)
      NotComparison.new(item)
    end

    class NotComparison < Comparison

      def Compare(left, right)
        return @comparator.Compare(left != right, true) if @comparator != nil
        left != right
      end

      def Text
        return @comparator.Text + " NOT" if @comparator != nil
        " NOT"
      end

    end
  end
end