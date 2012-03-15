module Sapphire
  module Events

    def Data(source)
      $source = Data.new(source)
      $events[$current_event].Targets($source)
    end

    class Data
      attr_reader :source
      attr_reader :constraints

      def initialize(source)
        @source = source[:source]
        @constraints = source[:constraints]
        @expectations = []
      end

      def Add(expectation)
        @expectations << expectation
      end
    end
  end
end