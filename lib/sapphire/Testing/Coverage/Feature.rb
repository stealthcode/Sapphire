module Sapphire
  module Testing
    module Coverage
      def Feature(token, &block)
        $features ||= []
        $features << Feature.new(token)
        block.call
      end

      class Feature

        attr_reader :business_rules
        attr_reader :token

        def initialize(token)
          @token = token
          @business_rules = []
        end

        def AddRule(business_rule)
          @business_rules << business_rule
        end

        def AddTest(test)
          @business_rules.last().AddTest test
        end

      end

    end
  end
end