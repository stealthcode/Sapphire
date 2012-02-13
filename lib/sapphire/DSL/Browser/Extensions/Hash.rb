class Hash < Object

  def With(options = {})
    $page = options.fetch(:page) if options.has_key? :page
  end

  def Set(hash)
    hash.keys.first.With(:page => $page)
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
          return Evaluation.new(control.Text, arg)
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
            return Evaluation.new(control.Text, arg)
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
            return Evaluation.new(count, arg)
          end
        }
      rescue
        return Evaluation.new(count, arg)
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
          return Evaluation.new(control.Text, arg)
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