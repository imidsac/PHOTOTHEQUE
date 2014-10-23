require 'rails_helper'

RSpec.describe "achats/new", :type => :view do
  before(:each) do
    assign(:achat, Achat.new(
      :fournisseur => nil,
      :type => "",
      :somme => "9.99",
      :payee => "9.99",
      :etat_achat => "MyString"
    ))
  end

  it "renders new achat form" do
    render

    assert_select "form[action=?][method=?]", achats_path, "post" do

      assert_select "input#achat_fournisseur_id[name=?]", "achat[fournisseur_id]"

      assert_select "input#achat_type[name=?]", "achat[type]"

      assert_select "input#achat_somme[name=?]", "achat[somme]"

      assert_select "input#achat_payee[name=?]", "achat[payee]"

      assert_select "input#achat_etat_achat[name=?]", "achat[etat_achat]"
    end
  end
end
