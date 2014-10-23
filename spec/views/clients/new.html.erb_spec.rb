require 'rails_helper'

RSpec.describe "clients/new", :type => :view do
  before(:each) do
    assign(:client, Client.new(
      :nom => "MyString",
      :prenom => "MyString",
      :phone => "MyString",
      :address => "MyText",
      :email => "MyString"
    ))
  end

  it "renders new client form" do
    render

    assert_select "form[action=?][method=?]", clients_path, "post" do

      assert_select "input#client_nom[name=?]", "client[nom]"

      assert_select "input#client_prenom[name=?]", "client[prenom]"

      assert_select "input#client_phone[name=?]", "client[phone]"

      assert_select "textarea#client_address[name=?]", "client[address]"

      assert_select "input#client_email[name=?]", "client[email]"
    end
  end
end
