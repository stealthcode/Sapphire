module Sapphire
  module DSL
    def Exist(value)
      Evaluator.new(value) do |item, comparator| item.Exist(item) end
    end
  end
end


