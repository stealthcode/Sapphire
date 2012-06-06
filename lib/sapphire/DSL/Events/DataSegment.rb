module Sapphire
  module DSL
    module Events
      class DataSegment

        def initialize(key)
          @key = key
          @expectations = []
        end

        def AddExpectation(expectation)
          @expectations << expectation
        end

      end
    end
  end
end