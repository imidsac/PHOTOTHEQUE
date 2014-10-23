require 'rails_helper'

RSpec.describe "fournisseurs/show", :type => :view do
  before(:each) do
    @fournisseur = assign(:fournisseur, Fournisseur.create!(
      :name_company => "Name Company",
      :nom => "Nom",
      :prenom => "Prenom",
      :phone => "Phone",
      :address => "MyText",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name Company/)
    expect(rendered).to match(/Nom/)
    expect(rendered).to match(/Prenom/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Email/)
  end
end
