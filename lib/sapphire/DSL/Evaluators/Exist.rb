module Sapphire
  module DSL
    def Exist(value)
      Not(Exist.new(value))
    end

    class Exist < Evaluator
      def execute
       @item.Exist(@item)
      end
    end
  end
end


