module Sapphire
  module DSL
    module Browser
      def In(item)
        Evaluator.new(item) do |item, comparator| item.In(item, comparator) end
      end
    end
  end
end

