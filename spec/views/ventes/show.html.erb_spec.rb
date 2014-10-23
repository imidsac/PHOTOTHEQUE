require 'rails_helper'

RSpec.describe "ventes/show", :type => :view do
  before(:each) do
    @vente = assign(:vente, Vente.create!(
      :boutique => nil,
      :client => nil,
      :clients => "Clients",
      :etat_vente => "Etat Vente",
      :somme => "9.99",
      :payee => "9.99",
      :type => "Type",
      :etat_vente => "Etat Vente"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Clients/)
    expect(rendered).to match(/Etat Vente/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/Etat Vente/)
  end
end
