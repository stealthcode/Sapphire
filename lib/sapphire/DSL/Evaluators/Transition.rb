module Sapphire
  module DSL
    module Browser
      def Transition(url)
        Evaluator.new(url) do |item, comparator| $driver.ShouldTransitionTo(item, comparator) end
      end
    end
  end
end

