class Given
  include Sapphire::Testing::Executable

  attr_reader :value
  attr_reader :text
  attr_reader :block
  attr_reader :finally
  attr_reader :when
  attr_reader :and
  attr_reader :parent
  attr_reader :results

  def initialize(parent, pre, text, &block)
    @value = text
    @text = pre + text.to_s
    @block = block
    @when = []
    @and = []
    @parent = parent
    @results = []
  end

  def add_when(pre, text, &block)
    if(self.value.is_a? Pending)
      @when << When.new(self, pre, Pending.new(text.to_s), &block)
    elsif(self.value.is_a? Broken)
      @when << When.new(self, pre, Broken.new(text), &block)
    else
      x = When.new(self, pre, text, &block)
      @when << x
    end
  end

  def last_when()
    @when.last
  end

  def add_finally(finally)
    @finally = finally
  end

  def add_and(pre, text, &block)
    if(self.value.is_a? Pending or text.is_a? Pending)
      self.and << And.new(self, Pending.new(pre + text.to_s), &block)
    elsif(self.value.is_a? Broken)
      self.and << And.new(self, Broken.new(pre + text.to_s), &block)
    else
      self.and << And.new(self, pre + text.to_s, &block)
    end
  end

  def AddResult(result)
    result.item = self
    @results << result
    self.parent.result.AddChild(result)
  end

end