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
        attr_reader :behaviors

        def initialize(hash)
          @token = hash.keys.first
          @priority = hash[hash.keys.first]
          @behaviors = []
        end

        def AddBehavior(behavior)
          @behaviors << behavior
        end

      end
    end
  end
end