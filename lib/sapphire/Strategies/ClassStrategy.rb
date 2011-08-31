module Sapphire
  module DSL
    module Strategies
      class ClassStrategy < Strategy
        def Show(item, modifier)
          evaluation, @page = @browser.ShouldNavigateTo item
          @page.Init
          {:page => @page, :value => evaluation }
        end
      end
    end
  end
end
