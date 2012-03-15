module Sapphire
  module Events
    def Where(constraint)
      temp = $source
      where = WhereExpectation.new(constraint)
      $source = where
      yield if block_given?
      $source = temp

      $events[$current_event].Add(where)
    end

    class WhereExpectation

      def initialize(constraint)
        @constraint = constraint
        @expectations = []
      end

      def Add(expectation)
        @expectations << expectation
      end

    end
  end
end