require 'rails_helper'

RSpec.describe "ventelignes/edit", :type => :view do
  before(:each) do
    @venteligne = assign(:venteligne, Venteligne.create!(
      :vente => nil,
      :qte => "9.99",
      :qtelivre => "9.99",
      :montant => "9.99",
      :etat => "MyString"
    ))
  end

  it "renders the edit venteligne form" do
    render

    assert_select "form[action=?][method=?]", venteligne_path(@venteligne), "post" do

      assert_select "input#venteligne_vente_id[name=?]", "venteligne[vente_id]"

      assert_select "input#venteligne_qte[name=?]", "venteligne[qte]"

      assert_select "input#venteligne_qtelivre[name=?]", "venteligne[qtelivre]"

      assert_select "input#venteligne_montant[name=?]", "venteligne[montant]"

      assert_select "input#venteligne_etat[name=?]", "venteligne[etat]"
    end
  end
end
