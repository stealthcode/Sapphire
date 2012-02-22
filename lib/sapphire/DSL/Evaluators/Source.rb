module Sapphire
  module DSL
    module Browser
      def Source(item)
        Source.new(item)
      end

      class Source < Evaluator
        def execute
          @comparator = EqualsComparison.new(@item) if @comparator == nil
          @item.Source(@item, @comparator)
        end
      end
    end
  end
end

