require 'rails_helper'

RSpec.describe "livraisonlogs/new", :type => :view do
  before(:each) do
    assign(:livraisonlog, Livraisonlog.new(
      :achat => nil,
      :produit => nil,
      :qte => "9.99",
      :vente => nil,
      :etat => "MyString",
      :user => nil
    ))
  end

  it "renders new livraisonlog form" do
    render

    assert_select "form[action=?][method=?]", livraisonlogs_path, "post" do

      assert_select "input#livraisonlog_achat_id[name=?]", "livraisonlog[achat_id]"

      assert_select "input#livraisonlog_produit_id[name=?]", "livraisonlog[produit_id]"

      assert_select "input#livraisonlog_qte[name=?]", "livraisonlog[qte]"

      assert_select "input#livraisonlog_vente_id[name=?]", "livraisonlog[vente_id]"

      assert_select "input#livraisonlog_etat[name=?]", "livraisonlog[etat]"

      assert_select "input#livraisonlog_user_id[name=?]", "livraisonlog[user_id]"
    end
  end
end
