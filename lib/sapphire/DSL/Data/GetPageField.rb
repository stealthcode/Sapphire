module Sapphire
  module DSL
    module Data
      def GetPageField(key)

        return $page.Get(key) if $page.Contains key

        raise "Could not find control for: " + key + " for page " + $page.to_s
      end
    end
  end
end

