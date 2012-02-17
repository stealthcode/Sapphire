module Sapphire
  module DSL
    module Strategies
      class Evaluation

        attr_reader :left
        attr_reader :right

        def initialize(left, right)
          @left = left
          @right = right
        end

        def Modify(left, right)
          return @modifier.Modify(left, right) if @modifier != nil
          EqualsModifier.new(self).Modify(left, right) if @modifier == nil
        end

        def ModifyWith(item)
          @modifier = item
        end

        def execute()
          self.Evaluate()
        end

        def Evaluate()

          if(!Modify(@left, @right))
            messages = []

            messages << "expected" + @modifier.Text + ": (nil)" if @left == nil
            messages << "expected" + @modifier.Text + ": " + @left.to_s if @left != nil
            messages << "got: (nil)" if @right == nil
            messages << "got: " + @right.to_s if @right != nil

            raise ExpectationException.new(messages)
          end

        end
      end
    end
  end
end