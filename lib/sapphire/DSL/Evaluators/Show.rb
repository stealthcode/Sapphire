module Sapphire
  module DSL
    module Browser
      def Show(item)
        Show.new(item)
      end

      class Show < Evaluator
        def execute
          @item.Show(@item, @comparator)
        end
      end
    end
  end
end

