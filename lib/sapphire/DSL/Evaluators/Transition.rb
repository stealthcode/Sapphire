module Sapphire
  module DSL
    module Browser

      def Transition(url)
        EqualsComparison.new(Transition.new(url))
      end

      class Transition < Evaluator
        def execute
          $driver.ShouldTransitionTo(@item, @comparator)
        end
      end
    end
  end
end

