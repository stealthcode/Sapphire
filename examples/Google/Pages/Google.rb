class Google < Page

  def Url
    "www.google.com"
  end

  def Init

    TextBox       :search_box, :id => "lst-ib"
    Button      :search, :xpath => "/html/body/div[2]/form/div/div[2]/table/tbody/tr/td/table/tbody/tr/td[2]/div/div/div/input"
    Button      :images, :id => "gb_2"

  end

end