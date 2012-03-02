class Background
  include Sapphire::Testing::Executable

  attr_reader :value
  attr_reader :text
  attr_reader :block
  attr_reader :parent
  attr_reader :results
  attr_reader :and

  def initialize(parent, pre, text, &block)
    @block = block
    @value = text
    @text = pre + text.to_s
    @parent = parent
    @results = []
    @and = []
  end

  def AddResult(result)
    result.item = self
    @results << result
    self.parent.result.AddChild(result)
  end

  def add_and(pre, text, &block)
    if(self.value.is_a? Pending)
      self.and << And.new(self, Pending.new(pre + text), &block)
    elsif(self.value.is_a? Broken)
      self.and << And.new(self, Broken.new(pre + text), &block)
    else
      self.and << And.new(self, pre + text, &block)
    end
  end

end