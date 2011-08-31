module Sapphire
  module DSL
    module Browser
      def Show(item)
        NullModifier.new(Show.new(item, @page, @browser))
      end

      class Show
        def initialize(item, page, browser)
          @item = item
          @page = page
          @browser = browser
        end

        def ModifyWith(item)
          @modifier = item
        end

        def execute
          return { :value => SapphireConfig.Current.GetBy(@item.class).new(@page, @browser).Show(@item, @modifier), :modifier => @modifier }
        end
      end
    end
  end
end

