require 'rails_helper'

RSpec.describe "banques/edit", :type => :view do
  before(:each) do
    @banque = assign(:banque, Banque.create!(
      :nom => "MyString"
    ))
  end

  it "renders the edit banque form" do
    render

    assert_select "form[action=?][method=?]", banque_path(@banque), "post" do

      assert_select "input#banque_nom[name=?]", "banque[nom]"
    end
  end
end
