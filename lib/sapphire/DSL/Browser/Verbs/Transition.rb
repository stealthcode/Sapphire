module Sapphire
  module DSL
    module Browser

      def Transition(url)
        EqualsModifier.new(Transition.new(url))
      end

      class Transition
        def initialize(item)
          @item = item
        end

        def ModifyWith(item)
          @modifier = item
        end

        def execute
          $browser.ShouldTransitionTo(@item, @modifier)
        end
      end
    end
  end
end

