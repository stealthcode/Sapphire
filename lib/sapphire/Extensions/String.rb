class String

  alias_method :"plus", :"+"

  def underscore
     self.gsub(/::/, '/').
     gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
     gsub(/([a-z\d])([A-Z])/,'\1_\2').
     tr("-", "_").
     downcase
  end

  def +(item)
    return plus(Parameter(item)) if Sapphire::DSL::TestPlans::Parameters.instance.Contains(item)
    raise "No Parameter defined for: " << item.to_s if item.is_a? Symbol

    plus(item)
  end

  def For(item)
    item
  end

  def namespace
    self.gsub(/::/, '_').
        gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
        gsub(/([a-z\d])([A-Z])/,'\1_\2').
        tr("-", "_")
  end

end