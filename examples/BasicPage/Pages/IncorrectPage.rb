class IncorrectPage < Page

  def Url
    return "file:///" + File.expand_path("../BasicPage1.html", File.dirname(__FILE__))
  end

  def Init

  end

end