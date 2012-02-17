module Sapphire
  module DSL
    module Strategies
      class EqualsModifier < Modifier

        def Modify(left, right)
          return @modifier.Modify(left == right, true) if @modifier != nil
          left == right
        end

        def Text
          ""
        end

      end
    end
  end
end
