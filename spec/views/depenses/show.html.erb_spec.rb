require 'rails_helper'

RSpec.describe "depenses/show", :type => :view do
  before(:each) do
    @depense = assign(:depense, Depense.create!(
      :description => "Description",
      :categoriedep => nil,
      :montant => "Montant",
      :etat_dep => "Etat Dep"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Montant/)
    expect(rendered).to match(/Etat Dep/)
  end
end
