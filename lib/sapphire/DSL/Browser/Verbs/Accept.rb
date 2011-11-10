module Sapphire
  module DSL
    module Browser
      def Accept(item)
        x = item.new
        x.Accept
      end
    end
  end
end