module Sapphire
  module DSL
    module Strategies
      class VisibleModifier < Modifier

        def Modify(left, right)
          return @modifier.Modify(left.displayed?, true) if @modifier != nil
          left.displayed?
        end

        def Text
          return @modifier.Text + " to be visible" if @modifier != nil
          " to be visible"
        end

      end
    end
  end
end
