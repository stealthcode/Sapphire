module Sapphire
  module DSL
    module Browser

      def Transition(url)
        NullModifier.new(Transition.new(url))
      end

      class Transition
        def initialize(item)
          @item = item
        end

        def ModifyWith(item)
          @modifier = item
        end

        def execute
          @modifier.Modify($browser.ShouldTransitionTo(@item))
        end
      end
    end
  end
end

