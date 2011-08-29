module Sapphire
  module DSL
    module TestPlans
      def Run(item)
        Runner.instance.last_test_plan.Add(item)
      end
    end
  end
end
