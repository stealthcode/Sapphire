module Sapphire
  module DSL
    module Browser
      def Day(value)
        day = Day.new(value, $compare1, $compare2)
        $compare1 = nil
        $compare2 = nil
        return day
      end

      class Day

        def initialize(value, compare1, compare2)
          @value = value
          if(compare1.is_a?(String))
            @compare1 = Date.parse(compare1)
          else
            @compare1 = compare1
          end

          if(compare2.is_a?(String))
            @compare2 = Date.parse(compare2)
          else
            @compare2 = compare2
          end
        end

        def Differ(comparator)
          return Fix(DifferComparison.new(Evaluation.new(@compare1 + @value, @compare2)), comparator)
        end

        def Fix(evaluation, comparator)
          comparator = EqualsComparison.new(evaluation) if comparator == nil
          comparator = comparator.Create(evaluation)

          comparator
        end

      end
    end
  end
end

