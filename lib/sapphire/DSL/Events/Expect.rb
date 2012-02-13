module Sapphire
  module DSL
    module Events
      def Expect(item)
        $events ||= {}
        $events.merge!(name => Event.new(name, block))
      end

      class Expectation

        def initialize(name, block)
          @name = name
          @block = block
        end

      end
    end
  end
end
