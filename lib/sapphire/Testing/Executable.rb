module Sapphire
  module Testing
    module Executable
      def execute(id)
        start = Time.now
        begin
          if(self.value.is_a? Pending)
            self.AddResult(ResultTree.new(self.text, TestResult.new("pending", self, "Pending", "", Time.now - start, id)))
            $stdout.print "*".yellow
            return
          end
          self.block.call
          self.AddResult(ResultTree.new(self.text, TestResult.new("pass", self, "Success", "", Time.now - start, id)))
          $stdout.print ".".green
        rescue => msg
          stack = ""
          msg.backtrace.each do |line|
            stack += "\r\n" + line
          end

          self.AddResult(ResultTree.new(self.text, TestResult.new("fail", self, msg.message, stack, Time.now - start, id)))
          $stdout.print "F".red
        end
      end
      @result
    end
  end
end

