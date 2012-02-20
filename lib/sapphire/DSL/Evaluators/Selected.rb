module Sapphire
  module DSL
    module Browser
      def Selected(item)
        Evaluator.new(item) do |item, comparator| item.Selected(item, comparator) end
      end
    end
  end
end

