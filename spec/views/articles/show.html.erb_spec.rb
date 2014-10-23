require 'rails_helper'

RSpec.describe "articles/show", :type => :view do
  before(:each) do
    @article = assign(:article, Article.create!(
      :name => "Name",
      :reference => "Reference",
      :etat => "Etat"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Reference/)
    expect(rendered).to match(/Etat/)
  end
end
