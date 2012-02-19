module Sapphire
  module DSL
    module Browser
      def Error(hash)
        EqualsComparison.new(Error.new(hash))
      end

      class Error < Evaluator
        def execute
           @item.Error(@item, @comparator)
        end
      end
    end
  end
end

