module Sapphire
  module DSL
    module Data
      def Exist(value)
        Not(Exist.new(value))
      end

      class Exist < Verb
        def execute
         @item.Exist(@item)
        end
      end
    end
  end
end


