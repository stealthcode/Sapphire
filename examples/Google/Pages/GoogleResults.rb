class GoogleResults < Page

  def Url
    "www.google.com/#hl="
  end

  def Init

    Label       :search_box, :id => "lst-ib"

  end

end