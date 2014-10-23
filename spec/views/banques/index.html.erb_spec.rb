require 'rails_helper'

RSpec.describe "banques/index", :type => :view do
  before(:each) do
    assign(:banques, [
      Banque.create!(
        :nom => "Nom"
      ),
      Banque.create!(
        :nom => "Nom"
      )
    ])
  end

  it "renders a list of banques" do
    render
    assert_select "tr>td", :text => "Nom".to_s, :count => 2
  end
end
