require 'rails_helper'

RSpec.describe "articles/edit", :type => :view do
  before(:each) do
    @article = assign(:article, Article.create!(
      :name => "MyString",
      :reference => "MyString",
      :etat => "MyString"
    ))
  end

  it "renders the edit article form" do
    render

    assert_select "form[action=?][method=?]", article_path(@article), "post" do

      assert_select "input#article_name[name=?]", "article[name]"

      assert_select "input#article_reference[name=?]", "article[reference]"

      assert_select "input#article_etat[name=?]", "article[etat]"
    end
  end
end
