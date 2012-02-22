class Hash < Object

  def Set(hash)
    hash.keys.first.Set(hash)
  end

  def For(item)
    {item => GetPageField(item).Text}
  end

  def Examine(item, comparator, &block)
    key = item.keys.first
    field = $page.Get(key)
    value = item[key]

    return FieldNotDefinedEvaluation.new(key, $page) if !$page.Contains key

    begin
      return FieldNotFoundEvaluation.new(key, $page) if field == nil

      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 5)
          result = wait.until {
            evaluation = block.call(field, value)
            y = evaluation.Evaluate()
            comparator = EqualsComparison.new(evaluation) if evaluation == nil
            evaluation if comparator.Compare(y == true, true)
          }

        return Fix(result, comparator)
      rescue
        return FieldNotFoundEvaluation.new(key, $page)
      end

    rescue
      return FieldNotFoundEvaluation.new(key, $page)
    end
  end

  def Show(item, comparator)
    Examine(item, comparator) do |field, value|
      field.Equals(value, comparator)
    end
  end

  def AltText(item, comparator)
    Examine(item, comparator) do |field, value|
      field.AltText(value, comparator)
    end
  end

  def Source(item, comparator)
    Examine(item, comparator) do |field, value|
      field.Source(value, comparator)
    end
  end

  def Contain(item, comparator)
    Examine(item, comparator) do |field, value|
      field.Contain(value)
    end
  end

  def Count(item, comparator)
    Examine(item, comparator) do |field, value|
      field.Count(value)
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

  def Fix(evaluation, comparator)
    comparator = comparator.Create(evaluation)
    comparator
  end
end