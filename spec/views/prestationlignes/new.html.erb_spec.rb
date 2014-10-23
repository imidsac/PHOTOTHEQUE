require 'rails_helper'

RSpec.describe "prestationlignes/new", :type => :view do
  before(:each) do
    assign(:prestationligne, Prestationligne.new(
      :prestation => nil,
      :qte => "9.99",
      :qtelivre => "9.99",
      :montant => "9.99",
      :numero_prise => 1,
      :type => false,
      :etat => "MyString"
    ))
  end

  it "renders new prestationligne form" do
    render

    assert_select "form[action=?][method=?]", prestationlignes_path, "post" do

      assert_select "input#prestationligne_prestation_id[name=?]", "prestationligne[prestation_id]"

      assert_select "input#prestationligne_qte[name=?]", "prestationligne[qte]"

      assert_select "input#prestationligne_qtelivre[name=?]", "prestationligne[qtelivre]"

      assert_select "input#prestationligne_montant[name=?]", "prestationligne[montant]"

      assert_select "input#prestationligne_numero_prise[name=?]", "prestationligne[numero_prise]"

      assert_select "input#prestationligne_type[name=?]", "prestationligne[type]"

      assert_select "input#prestationligne_etat[name=?]", "prestationligne[etat]"
    end
  end
end
