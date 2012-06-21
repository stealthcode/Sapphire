module Sapphire
  module Plugins

    class Plugin

      attr_reader :object
      attr_reader :method

      def observes(hash)
        @object = hash[:class]
        @method = hash[:method]
      end

      def self.observe()

      end

    end

  end
end