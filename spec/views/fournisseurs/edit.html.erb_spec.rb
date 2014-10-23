require 'rails_helper'

RSpec.describe "fournisseurs/edit", :type => :view do
  before(:each) do
    @fournisseur = assign(:fournisseur, Fournisseur.create!(
      :name_company => "MyString",
      :nom => "MyString",
      :prenom => "MyString",
      :phone => "MyString",
      :address => "MyText",
      :email => "MyString"
    ))
  end

  it "renders the edit fournisseur form" do
    render

    assert_select "form[action=?][method=?]", fournisseur_path(@fournisseur), "post" do

      assert_select "input#fournisseur_name_company[name=?]", "fournisseur[name_company]"

      assert_select "input#fournisseur_nom[name=?]", "fournisseur[nom]"

      assert_select "input#fournisseur_prenom[name=?]", "fournisseur[prenom]"

      assert_select "input#fournisseur_phone[name=?]", "fournisseur[phone]"

      assert_select "textarea#fournisseur_address[name=?]", "fournisseur[address]"

      assert_select "input#fournisseur_email[name=?]", "fournisseur[email]"
    end
  end
end
