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

    if(evaluation.left != evaluation.right)
      messages = []

      messages << "expected: (nil)" if evaluation.left == nil
      messages << "expected: " + evaluation.left.to_s if evaluation.left != nil
      messages << "got: (nil)" if evaluation.right == nil
      messages << "got: " + evaluation.right.to_s if evaluation.right != nil

      raise ExpectationException.new(messages)
    end
    #evaluation.left.should == evaluation.right if @modifier == nil
  end

  def execute
    @item.execute
  end
end