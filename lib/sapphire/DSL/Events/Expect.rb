module Sapphire
  module DSL
    module Events
      def Expect(item)
        constraint = nil
        constraint = $currentConstraint if !$currentConstraint.nil?
        $events[$currentEvent].AddExpectation(Expectation.new(item, constraint))
      end
    end
  end
end
