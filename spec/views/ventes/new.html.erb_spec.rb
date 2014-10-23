require 'rails_helper'

RSpec.describe "ventes/new", :type => :view do
  before(:each) do
    assign(:vente, Vente.new(
      :boutique => nil,
      :client => nil,
      :clients => "MyString",
      :etat_vente => "MyString",
      :somme => "9.99",
      :payee => "9.99",
      :type => "",
      :etat_vente => "MyString"
    ))
  end

  it "renders new vente form" do
    render

    assert_select "form[action=?][method=?]", ventes_path, "post" do

      assert_select "input#vente_boutique_id[name=?]", "vente[boutique_id]"

      assert_select "input#vente_client_id[name=?]", "vente[client_id]"

      assert_select "input#vente_clients[name=?]", "vente[clients]"

      assert_select "input#vente_etat_vente[name=?]", "vente[etat_vente]"

      assert_select "input#vente_somme[name=?]", "vente[somme]"

      assert_select "input#vente_payee[name=?]", "vente[payee]"

      assert_select "input#vente_type[name=?]", "vente[type]"

      assert_select "input#vente_etat_vente[name=?]", "vente[etat_vente]"
    end
  end
end
