module Sapphire
  module DSL
    module Browser
      def Contain(item)
        Evaluator.new(item) do |item, comparator| item.Contain(item, comparator) end
      end
    end
  end
end

