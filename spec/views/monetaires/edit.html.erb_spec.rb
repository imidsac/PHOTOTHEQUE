require 'rails_helper'

RSpec.describe "monetaires/edit", :type => :view do
  before(:each) do
    @monetaire = assign(:monetaire, Monetaire.create!(
      :money => "MyString",
      :code_money => "MyString",
      :valeur => "9.99"
    ))
  end

  it "renders the edit monetaire form" do
    render

    assert_select "form[action=?][method=?]", monetaire_path(@monetaire), "post" do

      assert_select "input#monetaire_money[name=?]", "monetaire[money]"

      assert_select "input#monetaire_code_money[name=?]", "monetaire[code_money]"

      assert_select "input#monetaire_valeur[name=?]", "monetaire[valeur]"
    end
  end
end
