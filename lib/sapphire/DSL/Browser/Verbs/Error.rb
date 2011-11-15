module Sapphire
  module DSL
    module Browser
      def Error(hash)
        NullModifier.new(Error.new(hash, @page))
      end

      class Error
        def initialize(item, page)
          @item = item
          @page = page
        end

        def ModifyWith(item)
          @modifier = item
        end

        def execute
           return { :value => SapphireConfig.Current.GetBy(@item.class).new(@page).Error(@item), :modifier => @modifier }
        end
      end
    end
  end
end

