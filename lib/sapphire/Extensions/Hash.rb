class Hash < Object

  def Set(hash)
    hash.keys.first.Set(hash)
  end

  def For(item)
    {item => GetPageField(item).Text}
  end

  def Show(item, comparator)
    key = item.keys.first
    control = GetPageField(key)
    arg = item[key]

    wait = Selenium::WebDriver::Wait.new(:timeout => 5)
    begin
      evaluation = wait.until { x = control
        val = x.Equals(arg, comparator)
        comparator = EqualsComparison.new(val) if comparator == nil
        if (comparator.Compare(val.left, val.right))
          val
        end
      }
    rescue
      evaluation = Evaluation.new(arg, control.Text)
      return Fix(evaluation, comparator)
    end

    return Fix(evaluation, comparator)
  end

  def Contain(item, comparator)

    key = item.keys.first
    control = GetPageField(key)
    arg = item[key]

    wait = Selenium::WebDriver::Wait.new(:timeout => 5)
    begin
      evaluation = wait.until { x = control
        val = x.Contain(arg)
        comparator = EqualsComparison.new(val) if comparator == nil
        if comparator.Compare(val.left, val.right)
          val
        end
      }
    rescue
      begin
        return Fix(Evaluation.new(arg, control.Text), comparator)
      rescue
        return FieldNotFoundEvaluation.new(item, $page)
      end
    end

    return Fix(evaluation, comparator)
  end

  def Count(item, comparator)
    ExecuteHashAgainstControl(item) do |control, arg|
      wait = Selenium::WebDriver::Wait.new(:timeout => 5)
      count = 0
      begin
        evaluation = wait.until { x = control
          count = x.Count
          if comparator.Compare(x.Count, arg)
            x = Evaluation.new(arg, count)
            return x
          end
        }
      rescue
        x = Evaluation.new(arg, count)
        return x
      end

      return evaluation
    end
  end

  def In(item, comparator)
     ExecuteHashAgainstControl(item) do |control, arg|
        wait = Selenium::WebDriver::Wait.new(:timeout => 5)
        begin
          evaluation = wait.until { x = control
            return x.In(arg, comparator)
          }
        rescue
          x = Evaluation.new(arg, control.Text)
          return x
        end

        return evaluation
     end
  end


  def Validate(hash)
    Evaluation.new(hash.keys.first.to_s, hash[hash.keys.first].to_s)
  end

  def Error(item, comparator)
    ExecuteHashAgainstControl(item) do |control, arg|
       return control.Equals(arg, comparator)
     end
  end

  def Fix(evaluation, comparator)
    comparator = EqualsComparison.new(evaluation) if comparator == nil
    comparator = comparator.Create(evaluation)
    comparator
  end
end