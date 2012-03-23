module Sapphire
  module DSL
    module TestPlans
      class PathHandler
        def Handle(item)
          x = ""
          x = AppConfig.Current.SpecsPath if AppConfig.Current
          Dir[x + item + '*.rb'].each  do |file|
            load file
            Runner.instance.last_scenario.file_name = file
            Runner.instance.last_scenario.execute
          end
        end
      end
    end
  end
end
