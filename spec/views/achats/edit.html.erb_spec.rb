require 'rails_helper'

RSpec.describe "achats/edit", :type => :view do
  before(:each) do
    @achat = assign(:achat, Achat.create!(
      :fournisseur => nil,
      :type => "",
      :somme => "9.99",
      :payee => "9.99",
      :etat_achat => "MyString"
    ))
  end

  it "renders the edit achat form" do
    render

    assert_select "form[action=?][method=?]", achat_path(@achat), "post" do

      assert_select "input#achat_fournisseur_id[name=?]", "achat[fournisseur_id]"

      assert_select "input#achat_type[name=?]", "achat[type]"

      assert_select "input#achat_somme[name=?]", "achat[somme]"

      assert_select "input#achat_payee[name=?]", "achat[payee]"

      assert_select "input#achat_etat_achat[name=?]", "achat[etat_achat]"
    end
  end
end
