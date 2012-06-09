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

      def self.IsObserver()
        true
      end

    end

    class SapphireObserver < Observer

      def initialize

        observes :class => :all,
                 :method => :all

      end

      def Notify(instance, method)
        puts "Method #{method} called on instance #{instance} - type #{instance.class}."
      end

    end

  end
end