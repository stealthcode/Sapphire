class GitHubHomePage < Page

  def Url
    "http://github.com"
  end

  def Init

    TextBox :search, :id => "q"

  end

end