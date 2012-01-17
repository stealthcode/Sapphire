class ContainsNullModifier
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

    if(!evaluation.left.include? evaluation.right)
      messages = []

      messages << "expected to contain: (nil)" if evaluation.right == nil
      messages << "expected to contain: " + evaluation.right.to_s if evaluation.right != nil
      messages << "got: (nil)" if evaluation.left == nil
      messages << "got: " + evaluation.left.to_s if evaluation.left != nil

      raise ExpectationException.new(messages)
    end
  end

  def execute
    @item.execute
  end
end