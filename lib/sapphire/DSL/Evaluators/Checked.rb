module Sapphire
  module DSL
    module Browser
      def Checked(item)
        Checked.new(item)
      end

      class Checked < Evaluator
        def execute
          @comparator = EqualsComparison.new(@item) if @comparator == nil
          @item.Checked(@item, @comparator)
        end
      end
    end
  end
end

