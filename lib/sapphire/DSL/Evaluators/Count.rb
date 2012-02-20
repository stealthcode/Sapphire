module Sapphire
  module DSL
    module Browser
      def Count(item)
        Evaluator.new(item) do |item, comparator| item.Count(item, comparator) end
      end
    end
  end
end