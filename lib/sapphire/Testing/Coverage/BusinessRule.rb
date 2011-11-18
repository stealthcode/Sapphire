module Sapphire
  module Testing
    module Coverage
      def BusinessRule(hash, &block)
        $features.last.AddRule(BusinessRule.new(hash, block))
      end

      class BusinessRule

        attr_reader :token
        attr_reader :priority
        attr_reader :tests

        def initialize(hash, block)
          @token = hash.keys.first
          @priority = hash[hash.keys.first]
          @tests = []
          block.call
        end

        def AddTest(test)
          @tests << test
        end

      end
    end
  end
end