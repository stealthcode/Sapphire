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
          if(evaluation.left == evaluation.right)
            messages = []

            messages << "expected NOT: (nil)" if evaluation.left == nil
            messages << "expected NOT: " + evaluation.left.to_s if evaluation.left != nil
            messages << "got: (nil)" if evaluation.right == nil
            messages << "got: " + evaluation.right.to_s if evaluation.right != nil

            raise ExpectationException.new(messages)
          end
          #evaluation.left.should_not == evaluation.right
        end

        def execute
          @item.execute
        end
      end
    end
  end
end