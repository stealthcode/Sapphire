module Sapphire
  module Testing
    module TestRunnerAdapter

      def Report(&block)
        $reporters.each do |reporter|
          block.call reporter
        end
      end

      def execute()
        Report do |x| x.ScenarioStart(self) end

        self.backgrounds.each do |b|

          b.execute

          b.and.each do |g_a|

            g_a.execute

          end

        end

        self.givens.each do |g|
          g.when.each do |w|

            g.execute

            g.and.each do |g_a|

              g_a.execute

            end

            w.execute

            w.and.each do |w_a|

              w_a.execute

            end

            w.then.each do |t|

              t.execute

              t.and.each do |t_a|

                t_a.execute

              end

            end

          end

          if(g.finally)

            g.finally.execute

          end

        end

        Report do |x| x.ScenarioComplete(self) end

      end
    end
  end
end



