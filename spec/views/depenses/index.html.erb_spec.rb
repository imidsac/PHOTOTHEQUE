require 'rails_helper'

RSpec.describe "depenses/index", :type => :view do
  before(:each) do
    assign(:depenses, [
      Depense.create!(
        :description => "Description",
        :categoriedep => nil,
        :montant => "Montant",
        :etat_dep => "Etat Dep"
      ),
      Depense.create!(
        :description => "Description",
        :categoriedep => nil,
        :montant => "Montant",
        :etat_dep => "Etat Dep"
      )
    ])
  end

  it "renders a list of depenses" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Montant".to_s, :count => 2
    assert_select "tr>td", :text => "Etat Dep".to_s, :count => 2
  end
end
