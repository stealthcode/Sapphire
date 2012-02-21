module Sapphire
  module DSL
    module Browser
      def Compare(control1, control2, &block)
        if(control1.is_a? Symbol)
          $compare1 = GetPageField(control1).Text
        else
          $compare1 = control1
        end
        if(control2.is_a? Symbol)
          $compare2 = GetPageField(control2).Text
        else
          $compare2 = control2
        end
        block.call()
      end
    end
  end
end