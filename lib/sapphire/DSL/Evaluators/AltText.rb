module Sapphire
  module DSL
    module Browser
      def AltText(item)
        AltText.new(item)
      end

      class AltText < Evaluator
        def execute
          @comparator = EqualsComparison.new(@item) if @comparator == nil
          @item.AltText(@item, @comparator)
        end
      end
    end
  end
end

