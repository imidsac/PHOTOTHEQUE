require 'rails_helper'

RSpec.describe "tbanques/show", :type => :view do
  before(:each) do
    @tbanque = assign(:tbanque, Tbanque.create!(
      :banque => nil,
      :type_rv => "Type Rv",
      :montant => "9.99",
      :porteur => "Porteur"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Type Rv/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Porteur/)
  end
end
