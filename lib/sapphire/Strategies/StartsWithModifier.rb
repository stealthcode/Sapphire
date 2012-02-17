module Sapphire
  module DSL
    module Strategies
      class StartsWithModifier < Modifier

        def Modify(left, right)
          return @modifier.Modify((left.starts_with? right), true) if @modifier != nil
          left.starts_with? right
        end

        def Text
          return @modifier.Text if @modifier != nil
          ""
        end

      end
    end
  end
end
