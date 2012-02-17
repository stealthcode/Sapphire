module Sapphire
  module DSL
    class Verb
      def initialize(item)
        @item = item
      end

      def ModifyWith(modifier)
        @modifier = modifier
        @item = modifier.Create(@item)
      end
    end
  end
end

