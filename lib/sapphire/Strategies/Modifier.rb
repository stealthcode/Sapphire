module Sapphire
  module DSL
    module Strategies
      class Modifier

        attr_reader :item

        def initialize(item)
          @item = item
          @item.ModifyWith(self) if @item.is_a? Evaluation or @item.is_a? Verb or @item.is_a? Modifier
        end

        def ModifyWith(item)
          @modifier = item
        end

        def Create(item)
          return self.class.new(item) if item.is_a? Modifier or item.is_a? Evaluation
          item
        end

        def Evaluate()
          self.execute
        end

        def execute
          @item.execute
        end
      end
    end
  end
end
