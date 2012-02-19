module Sapphire
  module DSL
    module Browser
      def Show(item)
        Show.new(item)
      end

      class Show < Verb
        def execute
          @item.Show(@item, @modifier)
        end
      end
    end
  end
end

