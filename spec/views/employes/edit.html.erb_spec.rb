require 'rails_helper'

RSpec.describe "employes/edit", :type => :view do
  before(:each) do
    @employe = assign(:employe, Employe.create!(
      :nom => "MyString",
      :prenom => "MyString",
      :sexe => "MyString",
      :phone => "MyString",
      :address => "MyText",
      :email => "MyString",
      :compte_banc => "MyString",
      :salaireb => "9.99",
      :type => ""
    ))
  end

  it "renders the edit employe form" do
    render

    assert_select "form[action=?][method=?]", employe_path(@employe), "post" do

      assert_select "input#employe_nom[name=?]", "employe[nom]"

      assert_select "input#employe_prenom[name=?]", "employe[prenom]"

      assert_select "input#employe_sexe[name=?]", "employe[sexe]"

      assert_select "input#employe_phone[name=?]", "employe[phone]"

      assert_select "textarea#employe_address[name=?]", "employe[address]"

      assert_select "input#employe_email[name=?]", "employe[email]"

      assert_select "input#employe_compte_banc[name=?]", "employe[compte_banc]"

      assert_select "input#employe_salaireb[name=?]", "employe[salaireb]"

      assert_select "input#employe_type[name=?]", "employe[type]"
    end
  end
end
