module Sapphire
  module DSL
    module Browser
      def Error(hash)
        NullModifier.new(Error.new(hash, @page, @browser))
      end

      class Error
        def initialize(item, page, browser)
          @item = item
          @page = page
          @browser = browser
        end

        def ModifyWith(item)
          @modifier = item
        end

        def execute
           return { :value => SapphireConfig.Current.GetBy(@item.class).new(@page, @browser).Error(@item), :modifier => @modifier }
        end
      end
    end
  end
end

