class Module
  def sub_modules
    [self] + constants.map {|const| const_get(const) }
    .select {|const| const.is_a? Module }
    .flat_map {|const| const.sub_modules }
  end

  def sub_classes
    self.constants.select {|c| Class === self.const_get(c)}
  end
end