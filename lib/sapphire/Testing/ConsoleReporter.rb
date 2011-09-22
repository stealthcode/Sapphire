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
          Indent(depth+1)
          $stdout.puts result.message
        end
      end

      def PrintHeader()

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
    end
  end
end
