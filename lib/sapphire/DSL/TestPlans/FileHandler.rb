module Sapphire
  module DSL
    module TestPlans
      class FileHandler
        def Handle(item)
          x = AppConfig.Current.SpecsPath || ""
          require File.expand_path(x + item, __FILE__)
          $stdout.puts item + ": "
          Runner.instance.last_scenario.execute 1
          $stdout.puts ""
        end
      end
    end
  end
end
