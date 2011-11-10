module Sapphire
  module DSL
    module Browser
      def Month(value, compare1, compare2)
        Month.new(value, compare1, compare2)
      end

      class Month

        def initialize(value, compare1, compare2)
          @value = value
          @compare1 = compare1
          @compare2 = compare2
        end

        def Differ()
          return (@compare1 >> @value) == @compare2
        end

      end
    end
  end
end

