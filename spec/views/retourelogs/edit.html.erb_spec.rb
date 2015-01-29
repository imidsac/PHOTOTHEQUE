require 'rails_helper'

RSpec.describe "retourelogs/edit", :type => :view do
  before(:each) do
    @retourelog = assign(:retourelog, Retourelog.create!(
      :produit => nil,
      :qte => "9.99",
      :optionretoure => nil,
      :achat => nil,
      :vente => nil,
      :motif => "MyString",
      :user => nil
    ))
  end

  it "renders the edit retourelog form" do
    render

    assert_select "form[action=?][method=?]", retourelog_path(@retourelog), "post" do

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
