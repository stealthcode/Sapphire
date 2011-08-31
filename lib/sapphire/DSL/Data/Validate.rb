module Sapphire
  module DSL
    module Data
      def Validate(hash)
        NullModifier.new(Validate.new(hash, @page, @browser))
      end

      class Validate
        def initialize(item, page, browser)
          @item = item
          @page = page
          @browser = browser
        end

        def ModifyWith(item)
          @modifier = item
        end

        def execute
          return { :value => SapphireConfig.Current.GetBy(@item.class).new(@page, @browser).Validate(@item), :modifier => @modifier }
        end
      end
    end
  end
end

