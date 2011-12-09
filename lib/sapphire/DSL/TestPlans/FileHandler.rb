module Sapphire
  module DSL
    module TestPlans
      class FileHandler
        def Handle(item)
          x = AppConfig.Current.SpecsPath || ""
          require File.expand_path(x + item, __FILE__)
          Runner.instance.last_scenario.file_name = item
          Runner.instance.last_scenario.execute
        end
      end
    end
  end
end
