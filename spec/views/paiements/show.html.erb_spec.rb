require 'rails_helper'

RSpec.describe "paiements/show", :type => :view do
  before(:each) do
    @paiement = assign(:paiement, Paiement.create!(
      :vente => nil,
      :client => nil,
      :achat => nil,
      :fournisseur => nil,
      :motif => "Motif",
      :montant => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Motif/)
    expect(rendered).to match(/9.99/)
  end
end
