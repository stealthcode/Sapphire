module Sapphire
  module Testing
    class ConsoleReporter < Reporter

      def PrintItem(result, depth)
        Indent(depth)

        if result.type == 'pass'
          $stdout.puts result.text.green
        elsif result.type == 'pending'
          $stdout.puts result.text.yellow
          Indent(depth+1)
          $stdout.puts " ## Not Yet Implemented ##"
        else
          $stdout.puts result.text.red
          if result.messages.is_a? Array
            result.messages.each do |message|
              Indent(depth+1)
              $stdout.puts message
            end

          else
            Indent(depth+1)
            $stdout.puts result.messages
          end
          $stdout.puts ""
          result.stack.each do |line|
            if (!line.include? "sapphire")
              Indent(depth+1)
              $stdout.puts line
            end
          end

        end
      end

      def PrintHeader()
        $stdout.puts ""
      end

      def ScenarioStart(scenario)
        $stdout.puts scenario.file_name + ": "
      end

      def ScenarioComplete(scenario)
        $stdout.puts ""
      end

      def PrintFooter()
        $stdout.puts ""
        $stdout.puts "Finished in " + self.time.round(2).to_s + " seconds."
        $stdout.puts "Test Count: " + self.test_count.to_s
        $stdout.puts "Passing: " + self.passing_count.to_s.green
        $stdout.puts "Failing: " + self.failing_count.to_s.red
        $stdout.puts "Pending: " + self.pending_count.to_s.yellow
      end

      def Indent(depth)
        (1..depth).each do
          $stdout.print "\t"
        end
      end

      def InsertLineBreak()
        $stdout.puts ""
      end

      def PrePrint

      end

      def PostPrint

      end

      def TestStarted(test)

      end

      def TestCompleted(test)
        $stdout.print "*".yellow if test.type == "pending"
        $stdout.print ".".green if test.type == "pass"
        $stdout.print "F".red if test.type == "fail"
      end

      def BeginTesting

      end

    end
  end
end
