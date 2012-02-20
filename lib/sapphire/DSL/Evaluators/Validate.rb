module Sapphire
  module DSL
    def Validate(hash)
      Evaluator.new(hash) do |item, comparator| item.Validate(item) end
    end
  end
end

