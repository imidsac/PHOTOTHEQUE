require 'rails_helper'

RSpec.describe "prestationlignes/show", :type => :view do
  before(:each) do
    @prestationligne = assign(:prestationligne, Prestationligne.create!(
      :prestation => nil,
      :qte => "9.99",
      :qtelivre => "9.99",
      :montant => "9.99",
      :numero_prise => 1,
      :type => false,
      :etat => "Etat"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Etat/)
  end
end
