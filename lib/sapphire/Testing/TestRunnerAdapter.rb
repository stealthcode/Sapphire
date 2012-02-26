module Sapphire
  module Testing
    module TestRunnerAdapter

      def Report(&block)
        $reporters.each do |reporter|
          block.call reporter
        end
      end

      def execute()
        Report do |reporter| reporter.ScenarioStart(self) end

        self.backgrounds.each do |background|

          background.execute

          background.and.each do |background_and|

            background_and.execute

          end

        end

        self.givens.each do |given|
          given.when.each do |when_|

            if when_.value.is_a? Pending
              given.pend()

              given.and.each do |given_and|

                given_and.pend()

              end
            else
              given.execute()

              given.and.each do |given_and|

                given_and.execute()

              end
            end

            when_.execute

            when_.and.each do |when_and|

              when_and.execute

            end

            when_.then.each do |then_|

              then_.execute

              then_.and.each do |then_and|

                then_and.execute

              end

            end

          end

          if(given.finally)

            given.finally.execute

          end

        end

        Report do |reporter| reporter.ScenarioComplete(self) end

      end
    end
  end
end



