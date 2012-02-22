module Sapphire
  module DSL
    module Browser
      def Should(item)
        results = item.execute()
        results.Output()
      end
    end
  end
end

