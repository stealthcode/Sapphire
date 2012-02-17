module Sapphire
  module DSL
    module Browser

      def Transition(url)
        EqualsModifier.new(Transition.new(url))
      end

      class Transition < Verb
        def execute
          $browser.ShouldTransitionTo(@item, @modifier)
        end
      end
    end
  end
end

