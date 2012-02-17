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

  def Fail(item)
    x = item.new
    x.Fail
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

  def Close
    x = self.new
    x.Close
  end

  def Show(item, modifier)
    evaluation = $browser.ShouldNavigateTo(item, modifier)
    modifier = modifier.Create(evaluation)
    puts modifier.inspect
    {:value => modifier }
  end

end