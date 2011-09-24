module Sapphire
  module DSL
    module TestPlans
      class PathHandler
        def Handle(item, reporter)
          x = AppConfig.Current.SpecsPath || ""
          Dir[x + item + '*.rb'].each  do |file|
            require file
            Runner.instance.last_scenario.file_name = file
            Runner.instance.last_scenario.execute reporter
          end
        end
      end
    end
  end
end
