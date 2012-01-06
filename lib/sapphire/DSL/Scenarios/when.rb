class When
  include Sapphire::Testing::Executable

  attr_reader :value
  attr_accessor :text
  attr_reader :block
  attr_reader :then
  attr_reader :and
  attr_reader :parent
  attr_reader :results

  def initialize(parent, pre, text, &block)
    @block = block
    @value = text
    @text = pre + text.to_s
    @then = []
    @and = []
    @parent = parent
    @results = []
  end

  def add_then(pre, text, &block)
    if(self.value.is_a? Pending)
      @then << Then.new(self, pre, Pending.new(text), &block)
    elsif(self.value.is_a? Problematic)
      @then << Then.new(self, pre, Problematic.new(text), &block)
    else
      @then << Then.new(self, pre, text, &block)
    end
  end

  def add_and(pre, text, &block)
    if(self.value.is_a? Pending)
      self.and << And.new(self, Pending.new(pre + text), &block)
    elsif(self.value.is_a? Problematic)
      self.and << And.new(self, Problematic.new(pre + text), &block)
    else
      self.and << And.new(self, pre + text, &block)
    end
  end

  def last_then
    @then.last
  end

  def AddResult(result)
    result.item = self
    @results << result
    self.parent.results.last.AddChild(result)
  end

end