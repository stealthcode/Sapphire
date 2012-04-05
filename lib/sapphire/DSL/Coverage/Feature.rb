module Sapphire
  module DSL
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

        def AddBehavior(behavior)
          @requirements.last().AddBehavior behavior
        end

        def Describe(text)

        end

      end
    end
  end
end