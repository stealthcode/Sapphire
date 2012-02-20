module Sapphire
  module DSL
    module Browser
      def Set(hash)
        hash.Set hash
      end
      #alias :Set :Verb
    end
  end
end
