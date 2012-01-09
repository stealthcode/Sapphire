module Sapphire
  module DSL
    module Strategies
      class SymbolStrategy < Strategy
        def Show(item, modifier)
          @page.fields.each do |field|
          field.keys.each do |field_key|
            if(field_key == item)
              begin
                x = field[field_key].Find
                if(x)
                  begin
                    wait = Selenium::WebDriver::Wait.new(:timeout => 5)
                    result = wait.until { y = modifier.Modify(x.displayed?)
                      y unless y == false
                    }
                    return Evaluation.new(modifier.Modify(x.displayed?), modifier.Modify(true))
                  rescue
                    return Evaluation.new(true, "An error occurred.")
                  end
                end
              rescue
               return Evaluation.new(true, "An error occurred.")
              end
            end
          end
        end

        raise "cannot find control matching " + item.to_s + " for page " + @page.to_s
        end

        def Hide(item, modifier)
          @page.fields.each do |field|
            field.keys.each do |field_key|
              if(field_key == item)
                begin
                  wait = Selenium::WebDriver::Wait.new(:timeout => 5)
                  element = wait.until { x = field[field_key].Find
                      x and modifier.Modify(!x.displayed?)
                  }
                  if(element)
                    return Evaluation.new(modifier.Modify(element.displayed?), modifier.Modify(true))
                  end
                rescue
                 return Evaluation.new(true, true)
                end
              end
            end
          end
          raise "cannot find control matching " + item.to_s + " for page " + @page.to_s
        end

        def Validate(hash)
          GetPageField(hash[hash.keys.first]).Equals(hash.keys.first.to_s)
        end
      end
    end
  end
end
