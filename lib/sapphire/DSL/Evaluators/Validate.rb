module Sapphire
  module DSL
    def Validate(hash)
      EqualsComparison.new(Validate.new(hash))
    end

    class Validate < Evaluator
     def execute
        @item.Validate(@item)
      end
    end
  end
end

