module Sapphire
  module Plugins

    class FirebugPlugin < Plugin

      def initialize

        observes :class => WebAbstractions::FireFoxBrowser,
                 :method => :Create

      end

      def Before(instance, method, args)
        args[0] = args[0].merge! :yay => :yay
      end

      def self.IsObserver()
        true
      end

    end

  end
end