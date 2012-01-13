module Sapphire
  module DSL
    module Strategies
      class HashStrategy < Strategy
        def Show(item, modifier)
           ExecuteHashAgainstControl(item, @page) do |control, arg|
              wait = Selenium::WebDriver::Wait.new(:timeout => 5)
              begin
                evaluation = wait.until { x = control
                  val = x.Equals(arg)
                  if (val.left == val.right)
                    val
                  end
                }
              rescue
                return Evaluation.new(control.Text, arg)
              end

              return evaluation
           end
        end

        def Count(item, modifier)
          ExecuteHashAgainstControl(item, @page) do |control, arg|
            wait = Selenium::WebDriver::Wait.new(:timeout => 5)
            evaluation = wait.until { x = control
              return x.Count(arg)
            }
            return evaluation
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
