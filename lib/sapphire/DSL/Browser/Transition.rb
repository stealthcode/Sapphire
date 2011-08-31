module Sapphire
  module DSL
    module Browser

      def Transition(url)
        NullModifier.new(Transition.new(url, @browser))
      end

      class Transition
        def initialize(item, browser)
          @item = item
          @browser = browser
        end

        def ModifyWith(item)
          @modifier = item
        end

        def execute
          @modifier.Modify(@browser.ShouldTransitionTo(@item))
        end
      end
    end
  end
end

