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

  def Show(item, comparator)

    return FieldNotDefinedEvaluation.new(item, $page) if !$page.Contains item

    begin
      x = $page.Get(item).Find(comparator)

      return Evaluation.new(true, true) if x.nil? and comparator.Compare(true, false)
      return FieldNotFoundEvaluation.new(item, $page) if x == nil
      return Evaluation.new(x.displayed?, true) if comparator != nil and comparator.Compare(x.displayed?, true)

      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 5)
        result = wait.until { y = x.displayed?, true
          y unless y == false
        }

        z = VisibleComparison.new(Evaluation.new(x, x))
        z.CompareWith(comparator)
        return z
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