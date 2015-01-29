require 'rails_helper'

RSpec.describe "retourelogs/new", :type => :view do
  before(:each) do
    assign(:retourelog, Retourelog.new(
      :produit => nil,
      :qte => "9.99",
      :optionretoure => nil,
      :achat => nil,
      :vente => nil,
      :motif => "MyString",
      :user => nil
    ))
  end

  it "renders new retourelog form" do
    render

    assert_select "form[action=?][method=?]", retourelogs_path, "post" do

      assert_select "input#retourelog_produit_id[name=?]", "retourelog[produit_id]"

      assert_select "input#retourelog_qte[name=?]", "retourelog[qte]"

      assert_select "input#retourelog_optionretoure_id[name=?]", "retourelog[optionretoure_id]"

      assert_select "input#retourelog_achat_id[name=?]", "retourelog[achat_id]"

      assert_select "input#retourelog_vente_id[name=?]", "retourelog[vente_id]"

      assert_select "input#retourelog_motif[name=?]", "retourelog[motif]"

      assert_select "input#retourelog_user_id[name=?]", "retourelog[user_id]"
    end
  end
end
