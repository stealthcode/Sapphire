module Sapphire
  module DSL
    module TestPlans
      class FileHandler
        def Handle(item)
          x = ""
          x = AppConfig.Current.SpecsPath if AppConfig.Current
          file = File.expand_path(item, __FILE__)
          file = File.expand_path(x + item, __FILE__) if !File.exists?(file)
          file = File.expand_path(File.dirname(__FILE__) + item) if !File.exists?(file)
          raise "File Not Found: " + item if !File.exists?(file)
          load file if File.exists?(file)
          
          Runner.instance.scenarios.each do |scenario|
            scenario.file_name = item if scenario.file_name == ""
            scenario.execute
          end

        end
      end
    end
  end
end
