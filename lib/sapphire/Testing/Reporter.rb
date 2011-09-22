module Sapphire
  module Testing
    class Reporter

      attr_reader :test_count
      attr_reader :passing_count
      attr_reader :failing_count
      attr_reader :pending_count
      attr_reader :time

      def OutputResults()

        self.GatherResults

        not_passing = self.GetNotPassing

        self.PrintHeader

        not_passing.keys.each do |key|
          self.PrePrint
          self.PrintResult not_passing[key]
          self.PostPrint
        end

        self.PrintFooter

      end

      def Output(result, depth)

        self.PrintItem(result, depth)

        result.results.each do |sub_result|
          self.Output(sub_result, depth+1)
        end
      end

      def PrintResult(entry)
        if entry.item.is_a? Given or entry.item.is_a? Background
          self.InsertLineBreak
          self.Output entry, 0
          self.InsertLineBreak
        elsif entry.item.is_a? When
          self.PrintItem entry.parent, 0
          self.Output entry, 1
          self.InsertLineBreak
        else
          self.PrintResult entry.parent
        end
      end

      def GatherResults()
        @test_count = 0
        @passing_count = 0
        @failing_count = 0
        @pending_count = 0
        @time = 0

        Runner.instance.scenarios.each do |scenario|
          item = scenario.result
          @time += item.time
          item.results.each do |result|
            output = self.Count result
            @test_count += output[:tests]
            @passing_count += output[:passing]
            @failing_count += output[:failing]
            @pending_count += output[:pending]
            @time += result.time
          end
        end
      end

      def Count(result)
        test_count = 1
        passing_count = 0
        failing_count = 0
        pending_count = 0

        if result.type == 'pass'
          passing_count += 1
        elsif result.type == 'pending'
          pending_count += 1
        else
          failing_count += 1
        end

        result.results.each do |sub_result|
          output = self.Count(sub_result)

          test_count += output[:tests]
          passing_count += output[:passing]
          failing_count += output[:failing]
          pending_count += output[:pending]
        end

        { :tests => test_count, :passing => passing_count, :failing => failing_count, :pending => pending_count }
      end

      def GetNotPassing

        results = {}

        Runner.instance.scenarios.each do |scenario|
          results = results.merge(self.RecurseResult(scenario.result))
        end

        results
      end

      def RecurseResult(result)
        results = {}

        result.results.each do |r|
          result_passes = r.type == "pass"
          if !result_passes and (r.item.is_a? Given or r.item.is_a? When or r.item.is_a? Background)
            results = results.merge({ r => r })
            next
          elsif !result_passes and (r.item.is_a? And or r.item.parent.is_a? Given)
            results = results.merge({ r.parent => r.parent })
            next
          elsif !result_passes and (r.item.is_a? And and r.parent.item.is_a? When)
            results = results.merge({ r.parent => r.parent })
            next
          elsif !result_passes and (r.item.is_a? Then)
            results = results.merge({ r.parent => r.parent })
            next
          elsif !result_passes and (r.item.is_a? And and r.parent.item.is_a? Then)
            results = results.merge({ r.parent.parent => r.parent.parent })
            next
          else
            results = results.merge(self.RecurseResult(r))
          end
        end

        results
      end

    end
  end
end