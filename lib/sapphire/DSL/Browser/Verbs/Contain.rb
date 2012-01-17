module Sapphire
  module DSL
    module Browser
      def Contain(item)
        ContainsNullModifier.new(Contain.new(item, @page))
      end

      class Contain
        def initialize(item, page)
          @item = item
          @page = page
        end

        def ModifyWith(item)
          @modifier = item
        end

        def execute
          return { :value => SapphireConfig.Current.GetBy(@item.class).new(@page).Contain(@item, @modifier), :modifier => @modifier }
        end
      end
    end
  end
end

