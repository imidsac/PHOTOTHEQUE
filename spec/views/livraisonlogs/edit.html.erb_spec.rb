require 'rails_helper'

RSpec.describe "livraisonlogs/edit", :type => :view do
  before(:each) do
    @livraisonlog = assign(:livraisonlog, Livraisonlog.create!(
      :achat => nil,
      :produit => nil,
      :qte => "9.99",
      :vente => nil,
      :etat => "MyString",
      :user => nil
    ))
  end

  it "renders the edit livraisonlog form" do
    render

    assert_select "form[action=?][method=?]", livraisonlog_path(@livraisonlog), "post" do

      assert_select "input#livraisonlog_achat_id[name=?]", "livraisonlog[achat_id]"

      assert_select "input#livraisonlog_produit_id[name=?]", "livraisonlog[produit_id]"

      assert_select "input#livraisonlog_qte[name=?]", "livraisonlog[qte]"

      assert_select "input#livraisonlog_vente_id[name=?]", "livraisonlog[vente_id]"

      assert_select "input#livraisonlog_etat[name=?]", "livraisonlog[etat]"

      assert_select "input#livraisonlog_user_id[name=?]", "livraisonlog[user_id]"
    end
  end
end
