class Hash < Object

  def Set(hash)
    hash.keys.first.Set(hash)
  end

  def For(item)
    {item => GetPageField(item).Text}
  end

  def Examine(item, &block)
    key = item.keys.first
    field = $page.Get(key)
    value = item[key]

    return FieldNotDefinedEvaluation.new(key, $page) if !$page.Contains key

    begin
      return FieldNotFoundEvaluation.new(key, $page) if field == nil

      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 5)
          result = wait.until {
            y = block.call(field, value).Evaluate()
            y if y == true
          }


        return block.call(field, value)
      rescue
        return FieldNotFoundEvaluation.new(key, $page)
      end

    rescue
      return FieldNotFoundEvaluation.new(key, $page)
    end
  end

  def Show(item, comparator)

    Examine(item) do |field, value|
      field.Equals(value, comparator)
    end

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
    rescue Exception => e
      puts e.to_s
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
    comparator = comparator.Create(evaluation)
    comparator
  end
end