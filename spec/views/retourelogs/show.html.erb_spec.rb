require 'rails_helper'

RSpec.describe "retourelogs/show", :type => :view do
  before(:each) do
    @retourelog = assign(:retourelog, Retourelog.create!(
      :produit => nil,
      :qte => "9.99",
      :optionretoure => nil,
      :achat => nil,
      :vente => nil,
      :motif => "Motif",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Motif/)
    expect(rendered).to match(//)
  end
end
