module Sapphire
  module DSL
    module Browser

      def Press(item)
         item.new().Press
      end

    end
  end
end