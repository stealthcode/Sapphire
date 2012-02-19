module Sapphire
  module DSL
    module Browser
      def Should(item)
        results = item.execute()
        results.Evaluate()
      end
    end
  end
end

