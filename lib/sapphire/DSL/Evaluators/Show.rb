module Sapphire
  module DSL
    module Browser
      def Show(item)
        Evaluator.new(item) do |item, comparator| item.Show(item, comparator) end
      end
    end
  end
end

