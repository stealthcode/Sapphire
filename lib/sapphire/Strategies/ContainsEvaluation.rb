module Sapphire
  module DSL
    module Strategies
      class ContainsEvaluation

        attr_reader :left
        attr_reader :right

        def initialize(left, right)
          @left = left
          @right = right
        end

        def Evaluate()
          if(!@left.include? @right)
            messages = []

            messages << "expected to contain: (nil)" if @left == nil
            messages << "expected to contain: " + @left.to_s if @left != nil
            messages << "got: (nil)" if @right == nil
            messages << "got: " + @right.to_s if @right != nil

            raise ExpectationException.new(messages)
          end
        end
      end
    end
  end
end