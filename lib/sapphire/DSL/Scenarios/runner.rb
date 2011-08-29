module Sapphire
  module DSL
    module Scenarios
      class Runner
        attr_accessor :scenarios
        attr_accessor :test_plans

        def self.create
          @@instance ||= Runner.new
        end

        def self.instance
          @@instance ||= self.create
        end

        def initialize
          @scenarios = []
          @test_plans = []
        end

        def add_scenario(scenario)
          @scenarios << scenario
        end

        def last_scenario
          @scenarios.last
        end

        def add_test_plan(test_plan)
          @test_plans << test_plan
        end

        def last_test_plan
          @test_plans.last
        end
      end
    end
  end
end

