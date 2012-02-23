module Sapphire
  module DSL
    def Exist(value)
      Evaluator.new(value) do |item, comparator| item.NotBeNil(item, comparator) end
    end
  end
end


