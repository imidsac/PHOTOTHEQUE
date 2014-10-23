require 'rails_helper'

RSpec.describe "alignes/new", :type => :view do
  before(:each) do
    assign(:aligne, Aligne.new(
      :achat => nil,
      :qte => "9.99",
      :qtelivre => "9.99",
      :montant => "9.99",
      :etat => "MyString"
    ))
  end

  it "renders new aligne form" do
    render

    assert_select "form[action=?][method=?]", alignes_path, "post" do

      assert_select "input#aligne_achat_id[name=?]", "aligne[achat_id]"

      assert_select "input#aligne_qte[name=?]", "aligne[qte]"

      assert_select "input#aligne_qtelivre[name=?]", "aligne[qtelivre]"

      assert_select "input#aligne_montant[name=?]", "aligne[montant]"

      assert_select "input#aligne_etat[name=?]", "aligne[etat]"
    end
  end
end
