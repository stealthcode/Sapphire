class ContainsModifier
  def initialize(item)
    @item = item
    @item.ModifyWith self
  end

  def ModifyWith(item)
    @modifier = item
  end

  def Modify(left, right)
    return @modifier.Modify((right.include? left), true) if @modifier != nil
    right.include? left
  end

  def Text
    return @modifier.Text + " to contain" if @modifier != nil
    " to contain"
  end

  def Evaluate(evaluation)
    return @modifier.Evaluate(evaluation) if @modifier != nil
    return evaluation.Evaluate()
  end

  def execute
    @item.execute
  end
end