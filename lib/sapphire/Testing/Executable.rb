module Sapphire
  module Testing
    module Executable
      def execute()
        start = Time.now
        Report do |x| x.TestStarted(self) end
        begin
          if(self.value.is_a? Pending)
            result = ResultTree.new(self.text, TestResult.new("pending", self, "Pending", "", Time.now - start))
            self.AddResult(result)
            Report do |x| x.TestPending(result) end
            return
          end
          self.block.call
          result = ResultTree.new(self.text, TestResult.new("pass", self, "Success", "", Time.now - start))
          self.AddResult(result)
          Report do |x| x.TestPassed(result) end
        rescue => msg
          stack = msg.backtrace
          message = msg.messages if (msg.is_a? ExpectationException)
          message ||= msg.message
          if(self.value.is_a? Problematic)
            result = ResultTree.new(self.text, TestResult.new("problematic", self, message, stack, Time.now - start))
            self.AddResult(result)
            Report do |x| x.TestProblematic(result) end
          else
            result = ResultTree.new(self.text, TestResult.new("fail", self, message, stack, Time.now - start))
            self.AddResult(result)
            Report do |x| x.TestFailed(result) end
          end
        end
      end

      def Report(&block)
        $reporters.each do |reporter|
          block.call reporter
        end
      end
    end
  end
end

