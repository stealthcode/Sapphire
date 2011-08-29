module Sapphire
  module DSL
    module TestPlans
      def Covers(item)
        Runner.instance.last_test_plan.Cover(item)
      end
    end
  end
end
