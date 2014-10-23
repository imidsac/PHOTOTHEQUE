require 'rails_helper'

RSpec.describe "banques/new", :type => :view do
  before(:each) do
    assign(:banque, Banque.new(
      :nom => "MyString"
    ))
  end

  it "renders new banque form" do
    render

    assert_select "form[action=?][method=?]", banques_path, "post" do

      assert_select "input#banque_nom[name=?]", "banque[nom]"
    end
  end
end
