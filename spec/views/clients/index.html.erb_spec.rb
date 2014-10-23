require 'rails_helper'

RSpec.describe "clients/index", :type => :view do
  before(:each) do
    assign(:clients, [
      Client.create!(
        :nom => "Nom",
        :prenom => "Prenom",
        :phone => "Phone",
        :address => "MyText",
        :email => "Email"
      ),
      Client.create!(
        :nom => "Nom",
        :prenom => "Prenom",
        :phone => "Phone",
        :address => "MyText",
        :email => "Email"
      )
    ])
  end

  it "renders a list of clients" do
    render
    assert_select "tr>td", :text => "Nom".to_s, :count => 2
    assert_select "tr>td", :text => "Prenom".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
