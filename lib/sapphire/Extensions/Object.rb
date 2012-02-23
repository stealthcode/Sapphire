class Object

  def NotBeNil(item, comparator)
    evaluation = Evaluation.new(item != nil, true)
    comparator = EqualsComparison.new(evaluation) if comparator == nil
    return comparator.Create(evaluation)
  end

end