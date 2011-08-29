module Sapphire
  module DSL
    module TestPlans
      class PathHandler
        def Handle(item)
          x = AppConfig.Current.SpecsPath || ""
          Dir[x + item + '*.rb'].each  do |file| require file end
        end
      end
    end
  end
end
