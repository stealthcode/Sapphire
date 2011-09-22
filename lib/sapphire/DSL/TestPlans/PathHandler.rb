module Sapphire
  module DSL
    module TestPlans
      class PathHandler
        def Handle(item)
          x = AppConfig.Current.SpecsPath || ""
          Dir[x + item + '*.rb'].each  do |file|
            require file
            $stdout.puts file + ": "
            Runner.instance.last_scenario.execute 1
            $stdout.puts ""
          end
        end
      end
    end
  end
end
