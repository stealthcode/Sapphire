module Sapphire
  module Testing
    module Coverage
      def Requirement(hash, &block)
        $features.last.AddRequirement(Requirement.new(hash))
        block.call
      end

      class Requirement

        attr_reader :token
        attr_reader :priority
        attr_reader :tests

        def initialize(hash)
          @token = hash.keys.first
          @priority = hash[hash.keys.first]
          @tests = []
        end

        def AddTest(test)
          @tests << test
        end

      end
    end
  end
end