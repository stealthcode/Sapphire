module Sapphire
  module DSL
    module Browser
      def Day(value, compare1, compare2)
        Day.new(value, compare1, compare2)
      end

      class Day

        def initialize(value, compare1, compare2)
          @value = value
          @compare1 = compare1
          @compare2 = compare2
        end

        def Differ()
          return (@compare1 + @value) == @compare2
        end

      end
    end
  end
end

