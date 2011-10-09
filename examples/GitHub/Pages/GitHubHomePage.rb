class GitHubHomePage < Page

  def Url
    "github.com"
  end

  def Init

    TextBox :search, :name => "q"

  end

end