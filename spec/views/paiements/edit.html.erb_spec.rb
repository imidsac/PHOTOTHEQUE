require 'rails_helper'

RSpec.describe "paiements/edit", :type => :view do
  before(:each) do
    @paiement = assign(:paiement, Paiement.create!(
      :vente => nil,
      :client => nil,
      :achat => nil,
      :fournisseur => nil,
      :motif => "MyString",
      :montant => "9.99"
    ))
  end

  it "renders the edit paiement form" do
    render

    assert_select "form[action=?][method=?]", paiement_path(@paiement), "post" do

      assert_select "input#paiement_vente_id[name=?]", "paiement[vente_id]"

      assert_select "input#paiement_client_id[name=?]", "paiement[client_id]"

      assert_select "input#paiement_achat_id[name=?]", "paiement[achat_id]"

      assert_select "input#paiement_fournisseur_id[name=?]", "paiement[fournisseur_id]"

      assert_select "input#paiement_motif[name=?]", "paiement[motif]"

      assert_select "input#paiement_montant[name=?]", "paiement[montant]"
    end
  end
end
