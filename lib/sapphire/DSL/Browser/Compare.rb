module Sapphire
  module DSL
    module Browser
      def Compare(control1, control2, &block)
        block.call(GetPageField(control1).Text, GetPageField(control2).Text)
      end
    end
  end
end