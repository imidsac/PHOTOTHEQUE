require 'rails_helper'

RSpec.describe "boutiques/show", :type => :view do
  before(:each) do
    @boutique = assign(:boutique, Boutique.create!(
      :name => "Name",
      :phone => "Phone",
      :address => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/MyText/)
  end
end
