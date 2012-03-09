class Hash < Object

  def Set(hash)
    hash.keys.first.Set(hash)
  end

  def For(item)
    {item => GetPageField(item).Text}
  end

  def Examine(item, comparator, &block)

    key = GetKey(item) do |item| item.keys.first end

    return FieldNotDefinedEvaluation.new(key, $page) if !$page.Contains key and !Parameters.instance.Contains key

    field = $page.Get(key) if $page.Contains key

    if(field.nil?)
      key1 = GetKey(item) do |item| item[item.keys.first] end
      if $page.Contains key1
        field = $page.Get(key1)
        flip = true
      end
    end

    return FieldNotFoundEvaluation.new(key, $page, "selenium could not find the field") if field == nil
    evaluation = field.Evaluate(key, item, comparator, block)

    if(flip)
      left = evaluation.left
      right = evaluation.right

      evaluation.right = left
      evaluation.left = right
    end

    return Fix(evaluation, comparator)
  end

  def GetKey(item, &block)
    return block.call(item.first) if item.first.is_a? Hash
    return item.first.first if item.first.is_a? Array
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