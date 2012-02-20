class Symbol

  def Clear
    ExecuteAgainstControl(self) do |control, arg|
      control.Set ""
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
    Examine(item, comparator, SelectedComparison) do |field|
      field.Selected
    end
  end

  def Checked(item, comparator)
    Examine(item, comparator, CheckedComparison) do |field|
      field.Checked
    end
  end

  def Show(item, comparator)
    Examine(item, comparator, VisibleComparison) do |field|
      field.Visible
    end
  end

  def Examine(item, comparator, comparison, &block)
    return FieldNotDefinedEvaluation.new(item, $page) if !$page.Contains item

    begin

      field = $page.Get(item)
      element = field.Find(comparator)

      return Evaluation.new(true, true) if element.nil? and comparator.Compare(true, false)
      return FieldNotFoundEvaluation.new(item, $page) if field == nil
      return Fix(comparison.new(Evaluation.new(field, field)), comparator) if comparator != nil and comparator.Compare(block.call(field), true)

      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 5)
        result = wait.until { y = block.call(field)
        y unless y == false
        }


        return Fix(Evaluation.new(field, field), comparator)
      rescue
        return FieldNotFoundEvaluation.new(item, $page)
      end

    rescue
      return FieldNotFoundEvaluation.new(item, $page)
    end
  end

  def Fix(evaluation, comparator)
    comparator = EqualsComparison.new(evaluation) if comparator == nil
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