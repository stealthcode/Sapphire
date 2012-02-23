module Sapphire
  module DSL
    def Validate(hash)
      Evaluator.new(hash) do |item, comparator| item.Validate(item, comparator) end
    end
  end
end

