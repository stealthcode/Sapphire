module Sapphire
  module DSL
    module Strategies
      class Modifier

        def initialize(item)
          @item = item
          @item.ModifyWith(self) if @item.is_a? Evaluation or @item.is_a? Verb
        end

        def Create(item)
          return self.class.new(item) if item.is_a? Modifier
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
