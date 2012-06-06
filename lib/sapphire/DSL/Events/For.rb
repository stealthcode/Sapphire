module Sapphire
  module DSL
    module Events
      def From(segment, &block)
        $currentSegment = segment
        block.call()
        $currentSegment = nil
      end
    end
  end
end