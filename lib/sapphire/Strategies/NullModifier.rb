class NullModifier
  def initialize(item)
    @item = item
    @item.ModifyWith self
  end

  def ModifyWith(item)
    @modifier = item
  end

  def Modify(item)
    return @modifier.Modify(item) if @modifier != nil
    item if @modifier == nil
  end

  def Evaluate(evaluation)
    return @modifier.Evaluate(evaluation) if @modifier != nil
    evaluation.left.should == evaluation.right if @modifier == nil
  end

  def execute
    @item.execute
  end
end