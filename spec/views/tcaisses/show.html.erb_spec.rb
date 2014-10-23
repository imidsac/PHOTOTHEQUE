require 'rails_helper'

RSpec.describe "tcaisses/show", :type => :view do
  before(:each) do
    @tcaisse = assign(:tcaisse, Tcaisse.create!(
      :crencier => "Crencier",
      :type => "Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Crencier/)
    expect(rendered).to match(/Type/)
  end
end
