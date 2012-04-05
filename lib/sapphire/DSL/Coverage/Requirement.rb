module Sapphire
  module DSL
    module Coverage
      def Requirement(token, hash, &block)
        $features.last.AddRequirement(Requirement.new(token, hash))
        block.call
      end

      class Requirement

        attr_reader :token
        attr_reader :priority
        attr_reader :behaviors

        def initialize(token, hash)
          @token = token
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