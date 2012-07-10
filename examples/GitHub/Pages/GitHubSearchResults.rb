class GitHubSearchResults < Page

  def Url
    "https://github.com/search?q=MarcusTheBold&type=Everything&repo=&langOverride=&start_value=1"
  end

  def Init
    List :users, :xpath => "//*[@class='result']/h2[@class='title']/a"
  end
end