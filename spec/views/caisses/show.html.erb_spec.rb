require 'rails_helper'

RSpec.describe "caisses/show", :type => :view do
  before(:each) do
    @caisse = assign(:caisse, Caisse.create!(
      :paiement => "9.99",
      :font => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
  end
end
