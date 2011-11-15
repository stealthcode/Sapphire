class Hash < Object

  def With(options = {})
    @page = options.fetch(:page) if options.has_key? :page
  end

  def Set(hash)
    hash.keys.first.With(:page => @page)
    hash.keys.first.Set(hash)
  end
end