module Sapphire
  module DSL
    module Coverage
      def Describe(text)
        $features.last().Describe(text)
      end
    end
  end
end