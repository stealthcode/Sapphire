module Sapphire
  module DSL
    module Strategies
      class DefaultStrategy < Strategy
        def Show(item, modifier)
          evaluation, @page = $browser.ShouldNavigateTo item
          @page.Init
          {:page => @page, :value => evaluation }
        end

        def Exists(item)
          Evaluation.new(item, nil)
        end
      end
    end
  end
end
