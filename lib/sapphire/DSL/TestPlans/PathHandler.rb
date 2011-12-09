module Sapphire
  module DSL
    module TestPlans
      class PathHandler
        def Handle(item)
          x = AppConfig.Current.SpecsPath || ""
          Dir[x + item + '*.rb'].each  do |file|
            require file
            Runner.instance.last_scenario.file_name = file
            Runner.instance.last_scenario.execute
          end
        end
      end
    end
  end
end
