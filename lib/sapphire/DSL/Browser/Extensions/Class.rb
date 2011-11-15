class Class < Module

  def Clear
    x = self.new
    x.Clear
  end

  def Exit(item)
    x = item.new
    x.Close
  end

  def Complete(item)
    x = item.new
    x.Complete
  end

  def Press(item)
    x = item.new
    x.Press
  end

  def Set(hash)
    text = hash[hash.keys.first]
    klass = hash.keys.first.new
    klass.Set text
  end

end