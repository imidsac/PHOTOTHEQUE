require 'rails_helper'

RSpec.describe "monetaires/index", :type => :view do
  before(:each) do
    assign(:monetaires, [
      Monetaire.create!(
        :money => "Money",
        :code_money => "Code Money",
        :valeur => "9.99"
      ),
      Monetaire.create!(
        :money => "Money",
        :code_money => "Code Money",
        :valeur => "9.99"
      )
    ])
  end

  it "renders a list of monetaires" do
    render
    assert_select "tr>td", :text => "Money".to_s, :count => 2
    assert_select "tr>td", :text => "Code Money".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
