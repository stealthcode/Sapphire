module Sapphire
  module DSL
    module Browser
      def Hide(args)
        NullModifier.new(Hide.new(args, @page, @browser))
      end

      class Hide
        def initialize(item, page, browser)
          @item = item
          @page = page
          @browser = browser
        end

        def ModifyWith(item)
          @modifier = item
        end

        def execute
          return { :value => SapphireConfig.Current.GetBy(@item.class).new(@page, @browser).Hide(@item, @modifier), :modifier => @modifier }
        end
      end
    end
  end
end

