module Sapphire
  module Testing
    class ConsoleReporter < Reporter

      def initialize
        @not_passing = {}
        @passing_count = 0
        @failing_count = 0
        @pending_count = 0
        @test_count = 0
      end

      def ScenarioStart(scenario)
        $stdout.puts scenario.file_name + ": "
      end

      def ScenarioComplete(scenario)
        $stdout.puts ""
      end

      def Indent(depth)
        (1..depth).each do
          $stdout.print "\t"
        end
      end

      def PrintItem(result, depth)
        Indent(depth)

        if result.type == 'pass'
          $stdout.puts result.text.colorize :green
        elsif result.type == 'pending'
          $stdout.puts result.text.colorize :yellow
          Indent(depth+1)
          $stdout.puts " ## Not Yet Implemented ##"
        else
          $stdout.puts result.text.colorize :red
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
            #if (!line.include? "sapphire")
              Indent(depth+1)
              $stdout.puts line
            #end
          end

        end
      end

      def InsertLineBreak()
        $stdout.puts ""
      end

      def TestStarted(test)
        @test_count = @test_count + 1
      end

      def TestPassed(test)
        @passing_count = @passing_count + 1
        $stdout.print ".".colorize :green
      end

      def TestFailed(test)
        @failing_count = @failing_count + 1
        Add test
        $stdout.print "F".colorize :red
      end

      def TestPending(test)
        @pending_count = @pending_count + 1
        Add test
        $stdout.print "*".colorize :yellow
      end

      def Add(r)
        result_passes = r.type == "pass"

        if !result_passes and (r.item.is_a? Given or r.item.is_a? When or r.item.is_a? Background)
          @not_passing = @not_passing.merge({ r => r })
        elsif !result_passes and (r.item.is_a? And or r.item.parent.is_a? Given)
          @not_passing = @not_passing.merge({ r.parent => r.parent })
        elsif !result_passes and (r.item.is_a? And and r.parent.item.is_a? When)
          @not_passing = @not_passing.merge({ r.parent => r.parent })
        elsif !result_passes and (r.item.is_a? Then)
          @not_passing = @not_passing.merge({ r.parent => r.parent })
        elsif !result_passes and (r.item.is_a? And and r.parent.item.is_a? Then)
          @not_passing = @not_passing.merge({ r.parent.parent => r.parent.parent })
        end

      end

      def OutputResults()
        $stdout.puts ""

        @not_passing.keys.each do |key|
          self.PrintResult @not_passing[key]
        end

        $stdout.puts ""
        $stdout.puts "Finished in " + (@end - @start).round().to_s + " seconds."
        $stdout.puts "Test Count: " + @test_count.to_s
        $stdout.puts "Passing: " + @passing_count.to_s.colorize(:green)
        $stdout.puts "Failing: " + @failing_count.to_s.colorize(:red)
        $stdout.puts "Pending: " + @pending_count.to_s.colorize(:yellow)
      end

      def Output(result, depth)

        self.PrintItem(result, depth)

        result.results.each do |sub_result|
          self.Output(sub_result, depth+1)
        end
      end

      def PrintResult(entry)
        if entry.item.is_a? Background
          self.InsertLineBreak
          self.Output entry, 0
          self.InsertLineBreak
        elsif entry.item.is_a? Given
          self.InsertLineBreak
          self.Output entry, 1
          self.InsertLineBreak
        elsif entry.item.is_a? When
          self.PrintItem entry.parent, 0
          self.Output entry, 1
          self.InsertLineBreak
        else
          self.PrintResult entry.parent
        end
      end

      def BeginTesting
        @start = Time.now
      end

      def TestingComplete
        @end = Time.now
      end

    end
  end
end
