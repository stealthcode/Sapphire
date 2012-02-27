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
      return FieldNotFoundEvaluation.new(key, $page, "selenium could not find the field") if field == nil

      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 5)
          result = wait.until {
            evaluation = block.call(field, value)
            y = evaluation.Evaluate()
            comparator = EqualsComparison.new(evaluation) if evaluation == nil
            evaluation if comparator.Compare(y == true, true)
          }

        return Fix(result, comparator)
      rescue => e
        return FieldNotFoundEvaluation.new(key, $page, e.to_s)
      end

    rescue => e
      return FieldNotFoundEvaluation.new(key, $page, e.to_s)
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
    Examine(item, comparator) do |field, value|
      field.In(value, comparator)
    end
  end


  def Validate(hash, comparator)
    Fix(Evaluation.new(hash.keys.first.to_s, hash[hash.keys.first].to_s), comparator)
  end

  def Fix(evaluation, comparator)
    comparator = comparator.Create(evaluation)
    comparator
  end
end