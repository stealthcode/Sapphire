module Sapphire
  module DSL
    module Strategies
      class HashStrategy < Strategy
        def Show(item, modifier)
           ExecuteHashAgainstControl(item, @page) do |control, arg|
              wait = Selenium::WebDriver::Wait.new(:timeout => 10)
              text = wait.until { x = control
                x unless (!x.Equals(arg) && x.Equals(""))
              }

              return text.Equals(arg)
           end
        end

        def Validate(hash)
          Evaluation.new(hash.keys.first.to_s, hash[hash.keys.first].to_s)
        end

        def Error(item)
          ExecuteHashAgainstControl(item, @page) do |control, arg|
             return control.Equals(arg)
           end
        end
      end
    end
  end
end
