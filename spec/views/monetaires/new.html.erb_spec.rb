require 'rails_helper'

RSpec.describe "monetaires/new", :type => :view do
  before(:each) do
    assign(:monetaire, Monetaire.new(
      :money => "MyString",
      :code_money => "MyString",
      :valeur => "9.99"
    ))
  end

  it "renders new monetaire form" do
    render

    assert_select "form[action=?][method=?]", monetaires_path, "post" do

      assert_select "input#monetaire_money[name=?]", "monetaire[money]"

      assert_select "input#monetaire_code_money[name=?]", "monetaire[code_money]"

      assert_select "input#monetaire_valeur[name=?]", "monetaire[valeur]"
    end
  end
end
