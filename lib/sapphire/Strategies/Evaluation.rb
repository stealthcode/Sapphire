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
          puts "modify " + self.class.to_s
          return @item.Modify(left, right) if @item != nil
          EqualsModifier.new(self).Modify(left, right) if @item == nil
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