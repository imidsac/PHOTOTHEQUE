require 'rails_helper'

RSpec.describe "articles/index", :type => :view do
  before(:each) do
    assign(:articles, [
      Article.create!(
        :name => "Name",
        :reference => "Reference",
        :etat => "Etat"
      ),
      Article.create!(
        :name => "Name",
        :reference => "Reference",
        :etat => "Etat"
      )
    ])
  end

  it "renders a list of articles" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Reference".to_s, :count => 2
    assert_select "tr>td", :text => "Etat".to_s, :count => 2
  end
end
