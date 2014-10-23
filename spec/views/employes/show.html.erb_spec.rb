require 'rails_helper'

RSpec.describe "employes/show", :type => :view do
  before(:each) do
    @employe = assign(:employe, Employe.create!(
      :nom => "Nom",
      :prenom => "Prenom",
      :sexe => "Sexe",
      :phone => "Phone",
      :address => "MyText",
      :email => "Email",
      :compte_banc => "Compte Banc",
      :salaireb => "9.99",
      :type => "Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nom/)
    expect(rendered).to match(/Prenom/)
    expect(rendered).to match(/Sexe/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Compte Banc/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Type/)
  end
end
