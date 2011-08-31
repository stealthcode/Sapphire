module Sapphire
  module DSL
    module Strategies
      class DefaultStrategy < Strategy
        def Show(item, modifier)
          @page = item
          @page.Init
          {:page => @page, :value => Evaluation.new(true, true)}
        end

        def Exists(item)
          Evaluation.new(item, nil)
        end
      end
    end
  end
end
