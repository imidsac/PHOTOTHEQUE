require 'rails_helper'

RSpec.describe "alignes/show", :type => :view do
  before(:each) do
    @aligne = assign(:aligne, Aligne.create!(
      :achat => nil,
      :qte => "9.99",
      :qtelivre => "9.99",
      :montant => "9.99",
      :etat => "Etat"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Etat/)
  end
end
