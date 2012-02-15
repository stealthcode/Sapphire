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

        def Evaluate()
          if(@left != @right)
            messages = []

            messages << "expected: (nil)" if @left == nil
            messages << "expected: " + @left.to_s if @left != nil
            messages << "got: (nil)" if @right == nil
            messages << "got: " + @right.to_s if @right != nil

            raise ExpectationException.new(messages)
          end

        end
      end
    end
  end
end