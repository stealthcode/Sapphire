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
      end
    end
  end
end