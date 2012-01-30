module Sapphire
  module DSL
    module Browser
      def Has(page)
        return !page.nil? && !page.empty?
      end
    end
  end
end
