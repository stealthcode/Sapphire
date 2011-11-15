module Sapphire
  module DSL
    module Browser
      def Set(hash)
        hash.With(:page => @page)
        hash.Set hash
      end
    end
  end
end
