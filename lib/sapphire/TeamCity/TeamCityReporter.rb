require 'teamcity/utils/logger_util'
require 'teamcity/rake_exceptions'
require 'teamcity/rakerunner_consts'

SPEC_FORMATTER_LOG = ::Rake::TeamCity::Utils::RakeFileLogger.new
SPEC_FORMATTER_LOG.log_msg("spec formatter.rb loaded.")

require 'teamcity/runner_common'
require 'teamcity/utils/service_message_factory'
require 'teamcity/utils/std_capture_helper'
require 'teamcity/utils/runner_utils'
require 'teamcity/utils/url_formatter'

module Sapphire
  module Testing
    module TeamCity
      class TeamCityReporter < Reporter
        include ::Rake::TeamCity::StdCaptureHelper
        include ::Rake::TeamCity::RunnerUtils
        include ::Rake::TeamCity::RunnerCommon
        include ::Rake::TeamCity::Utils::UrlFormatter

        TEAMCITY_FORMATTER_INTERNAL_ERRORS =[]
        @@reporter_closed = false
        @@RUNNING_EXAMPLES_STORAGE = {}

        ########## Teamcity #############################

        def log(msg)
          send_msg(msg)

          # returns:
          msg
        end

        def self.closed?()
          @@reporter_closed
        end

        def self.close()
          @@reporter_closed = true
        end

        ########## Teamcity #############################

        def initialize()
          # Setups Test runner's MessageFactory
          set_message_factory(::Rake::TeamCity::MessageFactory)

          # Initializes
          @groups_stack = []

          if ::Rake::TeamCity.is_in_idea_mode
            #log(@message_factory.create_tests_count(@example_count))
          elsif ::Rake::TeamCity.is_in_buildserver_mode
            log(@message_factory.create_progress_message("Starting..."))
          end

          @current = 0
        end

        def PrintItem(result, depth)

        end

        def ScenarioStart(scenario)
          log(@message_factory.create_suite_started("Scenario: " + scenario.text))
        end

        def ScenarioComplete(scenario)
          log(@message_factory.create_suite_finished("Finally"))
          log(@message_factory.create_suite_finished("Assuming"))
          log(@message_factory.create_suite_finished("Scenario: " + scenario.text))
        end

        def PrintHeader()

        end

        def PrintFooter()

        end

        def InsertLineBreak()

        end

        def PrePrint

        end

        def PostPrint

        end

        def TestStarted(test)

          if test.is_a? Given and @current > 0
            log(@message_factory.create_suite_finished("Then"))
            log(@message_factory.create_suite_finished("When"))
            log(@message_factory.create_suite_finished("Given"))
          elsif test.is_a? Finally
            log(@message_factory.create_suite_finished("Then"))
            log(@message_factory.create_suite_finished("When"))
            log(@message_factory.create_suite_finished("Given"))
          end

          @current = 1

          if test.is_a? Given
            log(@message_factory.create_suite_started("Given"))
          elsif test.is_a? When
            log(@message_factory.create_suite_started("When"))
          elsif test.is_a? Then
            log(@message_factory.create_suite_started("Then"))
          elsif test.is_a? Background
            log(@message_factory.create_suite_started("Assuming"))
          elsif test.is_a? Finally
            log(@message_factory.create_suite_started("Finally"))
          end

          @current = @current + 1

          log(@message_factory.create_test_started(test.text))
        end

        def TestPassed(test)
          log(@message_factory.create_test_finished(test.text, test.time))
          log(@message_factory.create_suite_finished("Finally")) if test.item.is_a? Finally
        end

        def TestFailed(test)
          if test.messages.is_a? Array
            messages = test.messages.join("\n")
          else
            messages = test.messages
          end
          stack = ""
          test.stack.each do |line|
            #if (!line.include? "sapphire")
              stack += line + "\n"
            #end
          end
          log(@message_factory.create_test_failed(test.text, messages, stack))
          log(@message_factory.create_suite_finished("Finally")) if test.item.is_a? Finally
        end

        def TestPending(test)
          log(@message_factory.create_test_ignored(test.text, "Pending: Not Yet Implemented"))
          log(@message_factory.create_suite_finished("Finally")) if test.item.is_a? Finally
        end

        def TestingComplete()

        end

        def BeginTesting
          log(@message_factory.create_test_reported_attached)
        end

        def OutputResults()

        end
      end
    end
  end
end