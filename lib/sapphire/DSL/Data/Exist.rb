module Sapphire
  module DSL
    module Data
      def Exist(value)
        Not(Exist.new(value, @page))
      end

      class Exist
        def initialize(item, page)
          @item = item
          @page = page
          @browser = browser
        end

        def ModifyWith(item)
          @modifier = item
        end

        def execute
          return { :value => SapphireConfig.Current.GetBy(@item.class).new(@page).Exists(@item), :modifier => @modifier }
        end
      end
    end
  end
end


