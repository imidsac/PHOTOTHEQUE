require 'rails_helper'

RSpec.describe "articles/new", :type => :view do
  before(:each) do
    assign(:article, Article.new(
      :name => "MyString",
      :reference => "MyString",
      :etat => "MyString"
    ))
  end

  it "renders new article form" do
    render

    assert_select "form[action=?][method=?]", articles_path, "post" do

      assert_select "input#article_name[name=?]", "article[name]"

      assert_select "input#article_reference[name=?]", "article[reference]"

      assert_select "input#article_etat[name=?]", "article[etat]"
    end
  end
end
