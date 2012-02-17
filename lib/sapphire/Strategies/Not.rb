module Sapphire
  module DSL
    module Strategies
      def Not(item)
        Not.new(item)
      end

      class Not < Modifier

        def Modify(left, right)
          return @modifier.Modify(left != right, true) if @modifier != nil
          left != right
        end

        def Text
          return @modifier.Text + " NOT" if @modifier != nil
          " NOT"
        end

      end
    end
  end
end