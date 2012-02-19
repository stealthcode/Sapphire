module Sapphire
  module DSL
    module Browser
      def Disable(args)
        return Not Show(args)
      end
    end
  end
end

