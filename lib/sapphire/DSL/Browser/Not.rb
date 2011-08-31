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

        def Modify(item)
          return @modifier.Modify(!item) if @modifier != nil
          !item
        end

        def Evaluate(evaluation)
          evaluation.left.should_not == evaluation.right
        end

        def execute
          @item.execute
        end
      end
    end
  end
end