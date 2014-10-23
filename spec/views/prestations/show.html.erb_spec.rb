require 'rails_helper'

RSpec.describe "prestations/show", :type => :view do
  before(:each) do
    @prestation = assign(:prestation, Prestation.create!(
      :client => nil,
      :employe => nil,
      :etat_prestation => "Etat Prestation",
      :somme => "9.99",
      :payee => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Etat Prestation/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
  end
end
