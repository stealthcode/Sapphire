module Sapphire
  module DSL
    module Browser
      def Not(item)
        Not.new(item)
      end

      class Not

        def initialize(item)
          @item = item
          @item.ModifyWith self
        end

        def Modify(left, right)
          return @modifier.Modify(left != right, true) if @modifier != nil
          left != right
        end

        def Text
          return @modifier.Text + " NOT" if @modifier != nil
          " NOT"
        end

        def Evaluate(evaluation)
          return @modifier.Evaluate(evaluation) if @modifier != nil
          return evaluation.Evaluate()
        end

        def execute
          @item.execute
        end
      end
    end
  end
end