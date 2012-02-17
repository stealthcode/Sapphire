module Sapphire
  module DSL
    module Browser
      def Error(hash)
        EqualsModifier.new(Error.new(hash))
      end

      class Error < Verb
        def execute
           return { :value => @item.Error(@item, @modifier) }
        end
      end
    end
  end
end

