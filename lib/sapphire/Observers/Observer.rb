module Sapphire
  module Observers

    class Observer

      attr_reader :object
      attr_reader :method
      attr_reader :on_match

      def observes(hash)
        @object = hash[:class]
        @method = hash[:method]
        @on_match = hash[:on_match]
      end

      def self.observe()

      end

    end

  end
end