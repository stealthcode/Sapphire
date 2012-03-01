class Hash < Object

  def Set(hash)
    hash.keys.first.Set(hash)
  end

  def For(item)
    {item => GetPageField(item).Text}
  end

  def Examine(item, comparator, &block)
    key = item.first.keys.first if item.first.is_a? Hash
    key = item.first.first if item.first.is_a? Array

    return FieldNotDefinedEvaluation.new(key, $page) if !$page.Contains key

    field = $page.Get(key)
    return FieldNotFoundEvaluation.new(key, $page, "selenium could not find the field") if field == nil

    return Fix(field.Evaluate(key, item, comparator, block), comparator)
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