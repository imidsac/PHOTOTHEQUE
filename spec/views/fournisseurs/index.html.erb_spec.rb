require 'rails_helper'

RSpec.describe "fournisseurs/index", :type => :view do
  before(:each) do
    assign(:fournisseurs, [
      Fournisseur.create!(
        :name_company => "Name Company",
        :nom => "Nom",
        :prenom => "Prenom",
        :phone => "Phone",
        :address => "MyText",
        :email => "Email"
      ),
      Fournisseur.create!(
        :name_company => "Name Company",
        :nom => "Nom",
        :prenom => "Prenom",
        :phone => "Phone",
        :address => "MyText",
        :email => "Email"
      )
    ])
  end

  it "renders a list of fournisseurs" do
    render
    assert_select "tr>td", :text => "Name Company".to_s, :count => 2
    assert_select "tr>td", :text => "Nom".to_s, :count => 2
    assert_select "tr>td", :text => "Prenom".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
