module Sapphire
  module DSL
    module Browser
      def Differ(value)
        Evaluator.new(value) do |value, comparator| value.Differ(comparator) end
      end
    end
  end
end

