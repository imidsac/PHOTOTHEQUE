require 'rails_helper'

RSpec.describe "banques/show", :type => :view do
  before(:each) do
    @banque = assign(:banque, Banque.create!(
      :nom => "Nom"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nom/)
  end
end
