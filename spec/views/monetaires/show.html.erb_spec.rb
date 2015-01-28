require 'rails_helper'

RSpec.describe "monetaires/show", :type => :view do
  before(:each) do
    @monetaire = assign(:monetaire, Monetaire.create!(
      :money => "Money",
      :code_money => "Code Money",
      :valeur => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Money/)
    expect(rendered).to match(/Code Money/)
    expect(rendered).to match(/9.99/)
  end
end
