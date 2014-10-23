require 'rails_helper'

RSpec.describe "employes/index", :type => :view do
  before(:each) do
    assign(:employes, [
      Employe.create!(
        :nom => "Nom",
        :prenom => "Prenom",
        :sexe => "Sexe",
        :phone => "Phone",
        :address => "MyText",
        :email => "Email",
        :compte_banc => "Compte Banc",
        :salaireb => "9.99",
        :type => "Type"
      ),
      Employe.create!(
        :nom => "Nom",
        :prenom => "Prenom",
        :sexe => "Sexe",
        :phone => "Phone",
        :address => "MyText",
        :email => "Email",
        :compte_banc => "Compte Banc",
        :salaireb => "9.99",
        :type => "Type"
      )
    ])
  end

  it "renders a list of employes" do
    render
    assert_select "tr>td", :text => "Nom".to_s, :count => 2
    assert_select "tr>td", :text => "Prenom".to_s, :count => 2
    assert_select "tr>td", :text => "Sexe".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Compte Banc".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
  end
end
