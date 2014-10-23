require 'rails_helper'

RSpec.describe "ventelignes/new", :type => :view do
  before(:each) do
    assign(:venteligne, Venteligne.new(
      :vente => nil,
      :qte => "9.99",
      :qtelivre => "9.99",
      :montant => "9.99",
      :etat => "MyString"
    ))
  end

  it "renders new venteligne form" do
    render

    assert_select "form[action=?][method=?]", ventelignes_path, "post" do

      assert_select "input#venteligne_vente_id[name=?]", "venteligne[vente_id]"

      assert_select "input#venteligne_qte[name=?]", "venteligne[qte]"

      assert_select "input#venteligne_qtelivre[name=?]", "venteligne[qtelivre]"

      assert_select "input#venteligne_montant[name=?]", "venteligne[montant]"

      assert_select "input#venteligne_etat[name=?]", "venteligne[etat]"
    end
  end
end
