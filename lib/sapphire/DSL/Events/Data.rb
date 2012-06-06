module Sapphire
  module DSL
    module Events
      def Data(item)
        segment = $events[$currentEvent].GetSegment(item)
        segment ||= DataSegment.new(item)

        $events[$currentEvent].AddSegment(item => segment)
      end
    end
  end
end