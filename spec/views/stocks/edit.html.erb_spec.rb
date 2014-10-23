require 'rails_helper'

RSpec.describe "stocks/edit", :type => :view do
  before(:each) do
    @stock = assign(:stock, Stock.create!(
      :cadre => nil,
      :article => nil,
      :stoc => "9.99"
    ))
  end

  it "renders the edit stock form" do
    render

    assert_select "form[action=?][method=?]", stock_path(@stock), "post" do

      assert_select "input#stock_cadre_id[name=?]", "stock[cadre_id]"

      assert_select "input#stock_article_id[name=?]", "stock[article_id]"

      assert_select "input#stock_stoc[name=?]", "stock[stoc]"
    end
  end
end
