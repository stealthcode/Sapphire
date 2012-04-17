module Sapphire
  module DSL
    module TestPlans

      def TestPlan(text, &block)
        Runner.instance.add_test_plan(TestPlan.new(text, &block))
      end

      class TestPlan

        attr_reader :block
        attr_reader :value
        attr_reader :text

        def initialize(text, &block)
          @value = text
          @text = text.to_s
          @block = block

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
                  handler[handler_key].Handle item[key]
                end
              end
            end
          end
        end

        def AddHandler(handler)
          @handlers << handler
        end

        def execute
          @block.call
        end

        def Report(&block)
          $instances.each do |reporter|
            block.call reporter
          end
        end
      end
    end
  end
end
