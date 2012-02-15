class Hash < Object

  def Set(hash)
    hash.keys.first.Set(hash)
  end

  def Show(item)
     ExecuteHashAgainstControl(item) do |control, arg|
        wait = Selenium::WebDriver::Wait.new(:timeout => 5)
        begin
          evaluation = wait.until { x = control
            val = x.Equals(arg)
            if (val.left == val.right)
              val
            end
          }
        rescue
          return Evaluation.new(arg, control.Text)
        end

        return evaluation
     end
  end

  def Contain(item)
     ExecuteHashAgainstControl(item) do |control, arg|
        wait = Selenium::WebDriver::Wait.new(:timeout => 5)
        begin
          evaluation = wait.until { x = control
            val = x.Contain(arg)
            if (val.left.include? val.right)
              return val
            end
          }
        rescue
          begin
            return Evaluation.new(arg, control.Text)
          rescue
            return Evaluation.new("Control Not Found", arg)
          end
        end

        return evaluation
     end
  end

  def Count(item)
    ExecuteHashAgainstControl(item) do |control, arg|
      wait = Selenium::WebDriver::Wait.new(:timeout => 5)
      count = 0
      begin
        evaluation = wait.until { x = control
          count = x.Count
          if x.Count == arg
            return Evaluation.new(arg, count)
          end
        }
      rescue
        return Evaluation.new(arg, count)
      end

      return evaluation
    end
  end

  def In(item)
     ExecuteHashAgainstControl(item) do |control, arg|
        wait = Selenium::WebDriver::Wait.new(:timeout => 5)
        begin
          evaluation = wait.until { x = control
            return x.In(arg)
          }
        rescue
          return Evaluation.new(arg, control.Text)
        end

        return evaluation
     end
  end


  def Validate(hash)
    Evaluation.new(hash.keys.first.to_s, hash[hash.keys.first].to_s)
  end

  def Error(item)
    ExecuteHashAgainstControl(item) do |control, arg|
       return control.Equals(arg)
     end
  end
end