module Sapphire
  module DSL
    module TestPlans
      class FileHandler
        def Handle(item, reporter)
          x = AppConfig.Current.SpecsPath || ""
          require File.expand_path(x + item, __FILE__)
          Runner.instance.last_scenario.file_name = item
          Runner.instance.last_scenario.execute reporter
        end
      end
    end
  end
end
