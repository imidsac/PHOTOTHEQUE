require 'rails_helper'

RSpec.describe "depenses/new", :type => :view do
  before(:each) do
    assign(:depense, Depense.new(
      :description => "MyString",
      :categoriedep => nil,
      :montant => "MyString",
      :etat_dep => "MyString"
    ))
  end

  it "renders new depense form" do
    render

    assert_select "form[action=?][method=?]", depenses_path, "post" do

      assert_select "input#depense_description[name=?]", "depense[description]"

      assert_select "input#depense_categoriedep_id[name=?]", "depense[categoriedep_id]"

      assert_select "input#depense_montant[name=?]", "depense[montant]"

      assert_select "input#depense_etat_dep[name=?]", "depense[etat_dep]"
    end
  end
end
