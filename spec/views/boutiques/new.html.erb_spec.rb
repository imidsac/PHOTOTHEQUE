require 'rails_helper'

RSpec.describe "boutiques/new", :type => :view do
  before(:each) do
    assign(:boutique, Boutique.new(
      :name => "MyString",
      :phone => "MyString",
      :address => "MyText"
    ))
  end

  it "renders new boutique form" do
    render

    assert_select "form[action=?][method=?]", boutiques_path, "post" do

      assert_select "input#boutique_name[name=?]", "boutique[name]"

      assert_select "input#boutique_phone[name=?]", "boutique[phone]"

      assert_select "textarea#boutique_address[name=?]", "boutique[address]"
    end
  end
end
