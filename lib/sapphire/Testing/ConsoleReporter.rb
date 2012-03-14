module Sapphire
  module Testing
    class ConsoleReporter < Reporter

      def initialize
        @not_passing = {}
        @passing_count = 0
        @failing_count = 0
        @pending_count = 0
        @broken_count = 0
        @test_count = 0
        @output = $stdout
      end

      def ScenarioStart(scenario)
        @output.puts scenario.file_name + ": "
      end

      def ScenarioComplete(scenario)
        @output.puts ""
      end

      def Indent(depth)
        (1..depth).each do
          @output.print "\t"
        end
      end

      def PrintItem(result, depth)
        Indent(depth)

        if result.type == 'pass'
          @output.puts result.text
        elsif result.type == 'pending'
          @output.puts result.text
          Indent(depth+1)
          @output.puts " ## Not Yet Implemented ##"
        elsif result.type == 'broken'
          @output.puts result.text
          Indent(depth+1)
          @output.puts " ## Broken ##"
        else
          @output.puts result.text
          if result.messages.is_a? Array
            result.messages.each do |message|
              Indent(depth+1)
              @output.puts message
            end

          else
            Indent(depth+1)
            @output.puts result.messages
          end
          @output.puts ""
          result.stack.each do |line|
            if (!line.include? "sapphire")
              Indent(depth+1)
              @output.puts line
            end
          end

        end
      end

      def InsertLineBreak()
        @output.puts ""
      end

      def TestStarted(test)
        @test_count = @test_count + 1
      end

      def TestPassed(test)
        @passing_count = @passing_count + 1
        @output.print "."
      end

      def TestFailed(test)
        @failing_count = @failing_count + 1
        Add test
        @output.print "F"
      end

      def TestPending(test)
        @pending_count = @pending_count + 1
        Add test
        @output.print "*"
      end

      def TestBroken(test)
        @broken_count = @broken_count + 1
        Add test
        @output.print "B"
      end

      def Add(r)
        result_passes = r.type == "pass"

        if !result_passes and (r.item.is_a? Given or r.item.is_a? Background)
          @not_passing = @not_passing.merge!({ r => r })
        elsif !result_passes and (r.item.is_a? When)
          @not_passing = @not_passing.merge!({ r.parent => r.parent })
        elsif !result_passes and (r.item.is_a? And and r.item.parent.is_a? Given)
          @not_passing = @not_passing.merge!({ r.parent => r.parent })
        elsif !result_passes and (r.item.is_a? And and r.parent.item.is_a? When)
          @not_passing = @not_passing.merge!({ r.parent.parent => r.parent.parent })
        elsif !result_passes and (r.item.is_a? Then)
          @not_passing = @not_passing.merge!({ r.parent.parent => r.parent.parent })
        elsif !result_passes and (r.item.is_a? And and r.parent.item.is_a? Then)
          @not_passing = @not_passing.merge!({ r.parent.parent.parent => r.parent.parent.parent })
        end

      end

      def OutputResults()
        @output.puts ""


        @not_passing.keys.each do |key|
          self.PrintResult @not_passing[key]
        end

        @output.puts ""
        @output.puts "Finished in " + (@end - @start).round().to_s + " seconds."
        @output.puts "Test Count: " + @test_count.to_s
        @output.puts "Passing: " + @passing_count.to_s
        @output.puts "Failing: " + @failing_count.to_s
        @output.puts "Pending: " + @pending_count.to_s
        @output.puts "Broken: " + @broken_count.to_s
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
