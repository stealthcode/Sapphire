module Sapphire
  module DSL
    module Browser
      def Contain(item)
        Contain.new(item)
      end

      class Contain < Evaluator
        def execute
           @item.Contain(@item, @comparator)
        end
      end
    end
  end
end

