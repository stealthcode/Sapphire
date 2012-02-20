module Sapphire
  module DSL
    module Browser
      def Error(hash)
        Evaluator.new(hash) do |item, comparator| @item.Error(item, comparator) end
      end
    end
  end
end

