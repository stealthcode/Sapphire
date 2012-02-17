module Sapphire
  module DSL
    module Strategies
      class StartsWithModifier < Modifier

        def Modify(left, right)
          return @modifier.Modify((left.start_with? right), true) if @modifier != nil
          left.start_with? right
        end

        def Text
          return @modifier.Text if @modifier != nil
          ""
        end

      end
    end
  end
end
