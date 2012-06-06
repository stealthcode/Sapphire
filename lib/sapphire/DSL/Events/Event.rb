module Sapphire
  module DSL
    module Events
      def Event(name, &block)
        $events ||= {}
        $events.merge!(name => Event.new(name))
        $currentEvent = name
        block.call()
        $currentEvent = nil
      end

      class Event

        def initialize(name)
          @name = name
          @segments = {}
        end

        def AddSegment(segment)
          @segments.merge! segment
        end

      end

    end
  end
end
