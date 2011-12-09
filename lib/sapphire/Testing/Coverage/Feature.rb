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
          @behaviors = []
        end

        def AddRequirement(requirement)
          @requirements << requirement
        end

        def AddBehavior(behavior)
          @requirements.last().AddBehavior behavior
        end

      end
    end
  end
end