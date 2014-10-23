require 'rails_helper'

RSpec.describe "achats/show", :type => :view do
  before(:each) do
    @achat = assign(:achat, Achat.create!(
      :fournisseur => nil,
      :type => "Type",
      :somme => "9.99",
      :payee => "9.99",
      :etat_achat => "Etat Achat"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Etat Achat/)
  end
end
