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

        def Contain(item, modifier)
           ExecuteHashAgainstControl(item, @page) do |control, arg|
              wait = Selenium::WebDriver::Wait.new(:timeout => 5)
              begin
                evaluation = wait.until { x = control
                  val = x.Contain(arg)
                  if (val.left.include? val.right)
                    return val
                  end
                }
              rescue
                return ContainsEvaluation.new(control.Text, arg)
              end

              return evaluation
           end
        end

        def Count(item, modifier)
          ExecuteHashAgainstControl(item, @page) do |control, arg|
            wait = Selenium::WebDriver::Wait.new(:timeout => 5)
            count = 0
            begin
              evaluation = wait.until { x = control
                count = x.Count
                if x.Count == arg
                  return Evaluation.new(count, arg)
                end
              }
            rescue
              return Evaluation.new(count, arg)
            end

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
