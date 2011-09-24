module Sapphire
  module Testing
    module TestRunnerAdapter

      def execute(reporter)
        reporter.ScenarioStart self
        @failures = []
        @pendings = []
        @success = []

        self.backgrounds.each do |b|

          b.execute reporter

        end

        self.givens.each do |g|

          g.when.each do |w|

            g.execute reporter

            g.and.each do |g_a|

              g_a.execute reporter

            end

            w.execute reporter

            w.and.each do |w_a|

              w_a.execute reporter

            end

            w.then.each do |t|

              t.execute reporter

              t.and.each do |t_a|

                t_a.execute reporter

              end

            end

          end

          if(g.finally)

            g.finally.execute reporter

          end

        end

        reporter.ScenarioComplete self

      end
    end
  end
end



