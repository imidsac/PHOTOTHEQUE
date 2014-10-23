require 'rails_helper'

RSpec.describe "paiements/new", :type => :view do
  before(:each) do
    assign(:paiement, Paiement.new(
      :vente => nil,
      :client => nil,
      :achat => nil,
      :fournisseur => nil,
      :motif => "MyString",
      :montant => "9.99"
    ))
  end

  it "renders new paiement form" do
    render

    assert_select "form[action=?][method=?]", paiements_path, "post" do

      assert_select "input#paiement_vente_id[name=?]", "paiement[vente_id]"

      assert_select "input#paiement_client_id[name=?]", "paiement[client_id]"

      assert_select "input#paiement_achat_id[name=?]", "paiement[achat_id]"

      assert_select "input#paiement_fournisseur_id[name=?]", "paiement[fournisseur_id]"

      assert_select "input#paiement_motif[name=?]", "paiement[motif]"

      assert_select "input#paiement_montant[name=?]", "paiement[montant]"
    end
  end
end
