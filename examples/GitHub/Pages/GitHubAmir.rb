class GitHubAmir < Page

  def Url
    "github.com/amirrajan"
  end

  def Init

    Label       :first_project, :xpath => "/html/body/div/div[2]/div[4]/div/ul/li/h3/a"
    Label       :second_project, :xpath => "/html/body/div/div[2]/div[4]/div/ul/li[2]/h3/a"
    Label       :third_project, :xpath => "/html/body/div/div[2]/div[4]/div/ul/li[3]/h3/a"
    Label       :fourth_project, :xpath => "/html/body/div/div[2]/div[4]/div/ul/li[4]/h3/a"
    Label       :fifth_project, :xpath => "/html/body/div/div[2]/div[4]/div/ul/li[5]/h3/a"

  end

end