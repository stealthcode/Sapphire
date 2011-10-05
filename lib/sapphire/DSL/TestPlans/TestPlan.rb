module Sapphire
  module DSL
    module TestPlans

      def TestPlan(text, &block)
        reporter = ConsoleReporter.new()
        Runner.instance.add_test_plan(TestPlan.new(text, reporter, &block))
      end

      class TestPlan

        attr_reader :block
        attr_reader :value
        attr_reader :text

        def initialize(text, reporter, &block)
          @value = text
          @text = text.to_s
          @block = block
          @reporter = reporter

          @items = []
          @handlers = []
          @coverage = []

          AddHandler :file => FileHandler.new
          AddHandler :path => PathHandler.new
        end

        def Cover(item)
          @coverage << item
        end

        def Add(item)
          item.keys.each do |key|
            @handlers.each do |handler|
              handler.keys.each do |handler_key|
                if(handler_key == key)
                  handler[handler_key].Handle item[key], @reporter
                end
              end
            end
          end
        end

        def AddHandler(handler)
          @handlers << handler
        end

        def execute
          @reporter.BeginTesting
          $stdout.puts ""
          @block.call
          @reporter.TestingComplete
          @reporter.OutputResults
        end
      end
    end
  end
end
