module Sapphire
  module Events
    def Event(symbol)
      $events ||= {}
      $events.merge! symbol => Event.new(symbol)
      yield if block_given?

      $current_event = nil
      $source = nil
    end

    class Event

      def initialize(symbol)
        @symbol = symbol
        @event_sources = []

        $current_event = symbol
      end

      def Targets(event_source)
        @event_sources << event_source
      end

      def Add(expectation)
        $source.Add(expectation)
      end

    end
  end
end