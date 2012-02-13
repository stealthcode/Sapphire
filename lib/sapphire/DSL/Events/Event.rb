module Sapphire
  module DSL
    module Events
      def Event(name, &block)
        $events ||= {}
        $events.merge!(name => Event.new(name, block))
      end

      class Event

        def initialize(name, block)
          @name = name
          @block = block
        end

      end
    end
  end
end
