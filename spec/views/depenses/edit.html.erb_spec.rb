require 'rails_helper'

RSpec.describe "depenses/edit", :type => :view do
  before(:each) do
    @depense = assign(:depense, Depense.create!(
      :description => "MyString",
      :categoriedep => nil,
      :montant => "MyString",
      :etat_dep => "MyString"
    ))
  end

  it "renders the edit depense form" do
    render

    assert_select "form[action=?][method=?]", depense_path(@depense), "post" do

      assert_select "input#depense_description[name=?]", "depense[description]"

      assert_select "input#depense_categoriedep_id[name=?]", "depense[categoriedep_id]"

      assert_select "input#depense_montant[name=?]", "depense[montant]"

      assert_select "input#depense_etat_dep[name=?]", "depense[etat_dep]"
    end
  end
end
