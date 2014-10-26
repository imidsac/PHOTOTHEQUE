require 'rails_helper'

RSpec.describe "tcoffres/show", :type => :view do
  before(:each) do
    @tcoffre = assign(:tcoffre, Tcoffre.create!(
      :beneficier => "Beneficier",
      :type_tc => "Type Tc"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Beneficier/)
    expect(rendered).to match(/Type Tc/)
  end
end
