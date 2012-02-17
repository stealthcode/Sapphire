module Sapphire
  module DSL
    module Strategies
      class ContainsModifier < Modifier

        def Modify(left, right)
          return @modifier.Modify((right.include? left), true) if @modifier != nil
          right.include? left
        end

        def Text
          return @modifier.Text + " to contain" if @modifier != nil
          " to contain"
        end

      end
    end
  end
end
