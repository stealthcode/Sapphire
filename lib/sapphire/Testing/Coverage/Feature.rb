module Sapphire
  module Testing
    module Coverage
      def Feature(token, &block)
        $features ||= []
        $features << Feature.new(token)
        block.call
      end

      class Feature

        attr_reader :requirements
        attr_reader :token

        def initialize(token)
          @token = token
          @requirements = []
        end

        def AddRequirement(requirement)
          @requirements << requirement
        end

        def AddTest(test)
          @requirements.last().AddTest test
        end

      end
    end
  end
end