class Symbol

  def With(options = {})
    @page = options.fetch(:page) if options.has_key? :page
  end

  def Check
    ExecuteAgainstControl(self, @page) do |control, arg|
      control.Check true
    end
  end

  def Click
    ExecuteAgainstControl(self, @page) do |control, arg|
      control.Click
    end
  end

  def MouseOver
    ExecuteAgainstControl(self, @page) do |control, arg|
      control.MouseOver
    end
  end

  def Uncheck
    ExecuteAgainstControl(self, @page) do |control, arg|
      control.Check false
    end
  end

  def Set(hash)
    ExecuteHashAgainstControl(hash, @page) do |control, arg|
      control.Set arg
    end
  end

end