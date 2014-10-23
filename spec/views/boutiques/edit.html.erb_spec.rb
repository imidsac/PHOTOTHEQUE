require 'rails_helper'

RSpec.describe "boutiques/edit", :type => :view do
  before(:each) do
    @boutique = assign(:boutique, Boutique.create!(
      :name => "MyString",
      :phone => "MyString",
      :address => "MyText"
    ))
  end

  it "renders the edit boutique form" do
    render

    assert_select "form[action=?][method=?]", boutique_path(@boutique), "post" do

      assert_select "input#boutique_name[name=?]", "boutique[name]"

      assert_select "input#boutique_phone[name=?]", "boutique[phone]"

      assert_select "textarea#boutique_address[name=?]", "boutique[address]"
    end
  end
end
