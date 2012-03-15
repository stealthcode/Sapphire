module Sapphire
  module Events
    def Expect(item)
      $events[$current_event].Add(Expectation.new(item))
    end

    class Expectation

      attr_reader :item

      def initialize(item)
        @item = item
      end
    end
  end
end