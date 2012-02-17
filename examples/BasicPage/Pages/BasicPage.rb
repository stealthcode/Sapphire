class BasicPage < Page
  def Url
    return "file:///" + File.expand_path("../BasicPage.html", File.dirname(__FILE__))
  end

  def Init

    Label   :welcome, :id => "welcome"
    TextBox :first_name, :id => "firstName"
    TextBox :last_name, :id => "lastName"
    Label   :ajax, :id => "ajax"
    Label   :slow_ajax, :id => "slowAjax"

  end

end