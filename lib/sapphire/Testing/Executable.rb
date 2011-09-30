module Sapphire
  module Testing
    module Executable
      def execute(reporter)
        start = Time.now
        reporter.TestStarted(self)
        begin
          if(self.value.is_a? Pending)
            result = ResultTree.new(self.text, TestResult.new("pending", self, "Pending", "", Time.now - start))
            self.AddResult(result)
            reporter.TestCompleted result
            return
          end
          self.block.call
          result = ResultTree.new(self.text, TestResult.new("pass", self, "Success", "", Time.now - start))
          self.AddResult(result)
          reporter.TestCompleted result
        rescue => msg
          stack = msg.backtrace
          message = msg.messages if (msg.is_a? ExpectationException)
          message ||= msg.message
          result = ResultTree.new(self.text, TestResult.new("fail", self, message, stack, Time.now - start))
          self.AddResult(result)
          reporter.TestCompleted result
        end
      end
    end
  end
end

