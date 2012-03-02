module Sapphire
  module Testing
    module Executable

      def pend()
        start = Time.now
        Report do |x| x.TestStarted(self) end

        result = ResultTree.new(self.text, TestResult.new("pending", self, "Pending", "", Time.now - start))
        self.AddResult(result)
        Report do |x| x.TestPending(result) end
      end

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
          if(self.value.is_a? Broken)
            result = ResultTree.new(self.text, TestResult.new("broken", self, message, stack, Time.now - start))
            self.AddResult(result)
            Report do |x| x.TestBroken(result) end
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

