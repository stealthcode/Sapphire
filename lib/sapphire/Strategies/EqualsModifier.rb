module Sapphire
  module DSL
    module Strategies
      class EqualsModifier
        def initialize(item)
          @item = item
          @item.ModifyWith self
        end

        def ModifyWith(item)
          @modifier = item
        end

        def Modify(left, right)
          return @modifier.Modify(left, right) if @modifier != nil
          left == right
        end

        def Text
          ""
        end

        def Evaluate(evaluation)
          return @modifier.Evaluate(evaluation) if @modifier != nil

          evaluation.Evaluate()
        end

        def execute
          @item.execute
        end
      end
    end
  end
end
