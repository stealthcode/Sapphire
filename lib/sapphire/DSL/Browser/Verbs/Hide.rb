module Sapphire
  module DSL
    module Browser
      def Hide(args)
        EqualsModifier.new(Hide.new(args))
      end

      class Hide < Verb
        def execute
          return { :value => @item.Hide(@item, @modifier) }
        end
      end
    end
  end
end

