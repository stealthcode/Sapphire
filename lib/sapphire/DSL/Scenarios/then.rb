class Then
  include Sapphire::Testing::Executable

  attr_reader :value
  attr_accessor :text
  attr_reader :block
  attr_reader :and
  attr_reader :parent
  attr_reader :results

  def initialize(parent, pre, text, &block)
    @block = block
    @value = text
    @text = pre + text.to_s
    @and = []
    @parent = parent
    @results = []
  end

  def add_and(pre, text, &block)
    if(self.value.instance_of? Pending or text.is_a? Pending)
      self.and << And.new(self, Pending.new(pre + text.to_s), &block)
    elsif(self.value.instance_of? Broken)
      self.and << And.new(self, Broken.new(pre + text), &block)
    else
      x = And.new(self, pre + text.to_s, &block)
      self.and << x
    end
  end

  def AddResult(result)
    result.item = self
    @results << result
    self.parent.results.last.AddChild(result)
  end

end