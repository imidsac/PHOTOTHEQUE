require 'rails_helper'

RSpec.describe "livraisonlogs/show", :type => :view do
  before(:each) do
    @livraisonlog = assign(:livraisonlog, Livraisonlog.create!(
      :achat => nil,
      :produit => nil,
      :qte => "9.99",
      :vente => nil,
      :etat => "Etat",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Etat/)
    expect(rendered).to match(//)
  end
end
