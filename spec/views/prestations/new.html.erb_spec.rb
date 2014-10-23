require 'rails_helper'

RSpec.describe "prestations/new", :type => :view do
  before(:each) do
    assign(:prestation, Prestation.new(
      :client => nil,
      :employe => nil,
      :etat_prestation => "MyString",
      :somme => "9.99",
      :payee => "9.99"
    ))
  end

  it "renders new prestation form" do
    render

    assert_select "form[action=?][method=?]", prestations_path, "post" do

      assert_select "input#prestation_client_id[name=?]", "prestation[client_id]"

      assert_select "input#prestation_employe_id[name=?]", "prestation[employe_id]"

      assert_select "input#prestation_etat_prestation[name=?]", "prestation[etat_prestation]"

      assert_select "input#prestation_somme[name=?]", "prestation[somme]"

      assert_select "input#prestation_payee[name=?]", "prestation[payee]"
    end
  end
end
