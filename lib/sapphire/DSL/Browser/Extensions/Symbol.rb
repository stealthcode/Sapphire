class Symbol

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

  def Show(item)

    return FieldNotDefinedEvaluation.new(item, $page) if !$page.Contains item

    begin
      x = $page.Get(item).Find

      return FieldNotFoundEvaluation.new(item, $page) if x == nil

      return Evaluation.new(x.displayed?, true) if x.displayed?

      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 5)
        result = wait.until { y = x.displayed?
          y unless y == false
        }
        return Evaluation.new(x.displayed?, modifier.Modify(true))
      rescue
        return FieldNotFoundEvaluation.new(item, $page)
      end

    rescue
      return FieldNotFoundEvaluation.new(item, $page)
    end

  end

  def Hide(item, modifier)

    return FieldNotDefinedEvaluation.new(item, $page) if !$page.Contains item

    begin
      wait = Selenium::WebDriver::Wait.new(:timeout => 5)
      element = wait.until { x = field[field_key].Find
          x and modifier.Modify(!x.displayed?)
      }
      if(element)
        return Evaluation.new(modifier.Modify(element.displayed?), modifier.Modify(true))
      end
    rescue
     return Evaluation.new(true, true)
    end

    return FieldNotDefinedEvaluation.new(item, $page)
  end

  def Validate(hash)
    GetPageField(hash[hash.keys.first]).Equals(hash.keys.first.to_s)
  end

end