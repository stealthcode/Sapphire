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
    DropDown    :item_list, :id => "item_list", :default => "Item 1"
    Button      :click_me!, :id => "button"
    Label       :button_clicked, :id => "button_clicked"
    Hyperlink   :link_click_me!, :id => "hyperlink"
    Label       :link_clicked, :id => "link_clicked"
    Title       :title
    RadioButton :radio1, :id => "radio1"
    RadioButton :radio2, :id => "radio2"
    CheckBox    :checkbox, :id => "checkbox"
    Hyperlink   :alert_me, :id => "alert"
    AlertBox    :alert
    TextBox     :date_1, :id => "date_1"
    TextBox     :date_2, :id => "date_2"
    Button      :click_me_to_disable_radio!, :id => "disable_radio"
    RadioButton :radio3, :id => "radio3"
    Label       :enter, :id => "enter"
    Image       :image, :id => "image"
    TextArea    :new_note, :id => "new_note"
    TextArea    :notes, :id => "notes"
    Button      :click_me_to_add_note!, :id => "add_note"
    TextBox     :read_only, :id => "read_only"

  end

  def Complete

    Clear :first_name
    Clear :last_name

    Set :first_name => "Completed"
    Set :last_name => "Completed"
    Set :item_list => "Item 3"
    Click :click_me!
    Click :link_click_me!
    Click :radio2
    Check :checkbox

  end

end