require 'rails_helper'

RSpec.describe "coffres/show", :type => :view do
  before(:each) do
    @coffre = assign(:coffre, Coffre.create!(
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
