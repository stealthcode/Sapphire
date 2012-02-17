module Sapphire
  module DSL
    module Browser
      def Count(item)
        EqualsModifier.new(Count.new(item))
      end

      class Count < Verb
        def execute
          return { :value => @item.Count(@item, modifier) }
        end
      end
    end
  end
end