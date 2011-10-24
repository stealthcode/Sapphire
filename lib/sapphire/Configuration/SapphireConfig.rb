module Sapphire
  module Configuration
    class SapphireConfig

      attr_reader :wait_time

      def initialize
        @@config = {}

        Add Symbol => SymbolStrategy
        Add Class => ClassStrategy
        Add Hash => HashStrategy
      end

      def self.Current
        @@instance ||= SapphireConfig.new
      end

      def Add(hash)
        @@config = @@config.merge(hash)
      end

      def GetBy(symbol)
        if(@@config.has_key? symbol)
          return @@config[symbol]
        end

        return DefaultStrategy
      end

    end
  end
end
