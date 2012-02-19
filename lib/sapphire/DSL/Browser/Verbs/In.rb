module Sapphire
  module DSL
    module Browser
      def In(item)
        EqualsModifier.new(In.new(item))
      end

      class In < Verb
        def execute
         @item.In(@item, modifier)
        end
      end
    end
  end
end

