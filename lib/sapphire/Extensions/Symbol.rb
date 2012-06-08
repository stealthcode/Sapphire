class Symbol

  def Clear(item)
    ExecuteAgainstControl(self) do |control, arg|
      control.Clear
    end
  end

  def Check
    ExecuteAgainstControl(self) do |control, arg|
      control.Check true
    end
  end

  def Click
    ExecuteAgainstControl(self) do |control, arg|
      control.Click
    end
  end

  def Accept
    ExecuteAgainstControl(self) do |control, arg|
      control.Accept
    end
  end

  def MouseOver
    ExecuteAgainstControl(self) do |control, arg|
      control.MouseOver
    end
  end

  def Uncheck
    ExecuteAgainstControl(self) do |control, arg|
      control.Check false
    end
  end

  def Set(hash)
    ExecuteHashAgainstControl(hash) do |control, arg|
      control.Set arg
    end
  end

  def Selected(item, comparator)
    Examine(item, comparator) do |field, value|
      field.Selected
    end
  end

  def Checked(item, comparator)
    Examine(item, comparator) do |field, value|
      field.Checked
    end
  end

  def Show(item, comparator)
    Examine(item, comparator) do |field, value|
      field.Visible
    end
  end

  def Examine(key, comparator, &block)
    item = key
    key = item.first if item.is_a? Array
    return FieldNotDefinedEvaluation.new(key, $page) if !$page.Contains key

    field = $page.Get(key)
    return FieldNotFoundEvaluation.new(key, $page, "selenium could not find the field") if field == nil

    element = field.Find(comparator)
    return Evaluation.new(true, true) if element.nil? and comparator.Compare(true, false)

    return Fix(field.Evaluate(key, item, comparator, block), comparator)
  end

  def Fix(evaluation, comparator)
    comparator = comparator.Create(evaluation)
    comparator
  end

  def Validate(hash)
    GetPageField(hash[hash.keys.first]).Equals(hash.keys.first.to_s)
  end

  def +(item)
    return Parameter(self) + item if Sapphire::DSL::TestPlans::Parameters.instance.Contains(self)
    raise "No Parameter defined for: " << self.to_s
  end

end