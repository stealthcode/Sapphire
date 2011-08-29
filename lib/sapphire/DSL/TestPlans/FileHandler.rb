module Sapphire
  module DSL
    module TestPlans
      class FileHandler
        def Handle(item)
          x = AppConfig.Current.SpecsPath || ""
          require File.expand_path(x + item, __FILE__)
        end
      end
    end
  end
end
