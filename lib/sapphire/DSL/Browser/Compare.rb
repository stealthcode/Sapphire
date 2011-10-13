module Sapphire
  module DSL
    module Browser
      def Compare(control1, control2, &block)
        if(control1.is_a? Symbol)
          control1text = GetPageField(control1).Text
        else
          control1text = control1
        end
        if(control2.is_a? Symbol)
          control2text = GetPageField(control2).Text
        else
          control2text = control2
        end
        block.call(control1text, control2text)
      end
    end
  end
end