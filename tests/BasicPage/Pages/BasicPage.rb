class BasicPage < Page

  def Url
    return "file:///" + File.expand_path("../BasicPage.html", File.dirname(__FILE__))
  end

  def Init

    Label       :welcome, :id => "welcome"
    TextBox     :first_name, :id => "firstName"
    TextBox     :last_name, :id => "lastName"
    Label       :ajax, :id => "ajax"
    Label       :slow_ajax, :id => "slowAjax"
    TextBox     :bogus_field, :id => "bogus"
    List        :value_list, :xpath => "id('value_list')/td"
    DropDown    :item_list, :id => "item_list"
    Button      :click_me!, :id => "button"
    Label       :button_clicked, :id => "button_clicked"
    Hyperlink   :link_click_me!, :id => "hyperlink"
    Label       :link_clicked, :id => "link_clicked"
    Title       :title
    RadioButton :radio1, :id => "radio1"
    RadioButton :radio2, :id => "radio2"
    CheckBox    :checkbox, :id => "checkbox"

  end

end