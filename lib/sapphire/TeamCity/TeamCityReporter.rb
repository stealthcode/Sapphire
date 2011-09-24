require 'teamcity/utils/logger_util'
require 'teamcity/rake_exceptions'
require 'teamcity/rakerunner_consts'

SPEC_FORMATTER_LOG = ::Rake::TeamCity::Utils::RSpecFileLogger.new
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

          @example_count = 100
          if ::Rake::TeamCity.is_in_idea_mode
            log(@message_factory.create_tests_count(@example_count))
          elsif ::Rake::TeamCity.is_in_buildserver_mode
            log(@message_factory.create_progress_message("Starting.. (#{@example_count} examples)"))
          end

        end

        def PrintItem(result, depth)

        end

        def ScenarioStart(scenario)
          @message_factory.create_suite_started(scenario.text, scenario.file_name)
        end

        def ScenarioComplete(scenario)
          @message_factory.create_suite_finished(scenario.text)
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
          @@RUNNING_EXAMPLES_STORAGE[test.object_id] = test
        end

        def TestCompleted(test)
          if test.type == "pending"
            @message_factory.create_test_output_message(test.text, true, "Pending: Not Yet Implemented")
            @message_factory.create_test_ignored(test.text, "Pending: Not Yet Implemented")
            return
          end
          if test.type == "pass"
            @message_factory.create_test_finished(test.text, test.time)
            return
          end
          if test.type == "fail"
            @message_factory.create_test_output_message(test.text, true, "enter error here")
            @message_factory.create_test_failed(test.text, test.message, "enter backtrace here")
          end

          @@RUNNING_EXAMPLES_STORAGE.delete(test.object_id)
        end
      end
    end
  end
end