module Sapphire
  module DSL
    module Coverage
      def Behavior(token, hash)
        $features.last().AddBehavior(Behavior.new(token, hash))
      end

      class Behavior

        attr_reader   :token
        attr_reader   :type
        attr_accessor :is_covered
        attr_accessor :covered_by

        def initialize(token, hash)
          @token = token
          @type = hash[hash.keys.first]
        end

      end
    end
  end
end