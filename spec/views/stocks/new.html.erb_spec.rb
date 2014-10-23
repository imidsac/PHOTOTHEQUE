require 'rails_helper'

RSpec.describe "stocks/new", :type => :view do
  before(:each) do
    assign(:stock, Stock.new(
      :cadre => nil,
      :article => nil,
      :stoc => "9.99"
    ))
  end

  it "renders new stock form" do
    render

    assert_select "form[action=?][method=?]", stocks_path, "post" do

      assert_select "input#stock_cadre_id[name=?]", "stock[cadre_id]"

      assert_select "input#stock_article_id[name=?]", "stock[article_id]"

      assert_select "input#stock_stoc[name=?]", "stock[stoc]"
    end
  end
end
