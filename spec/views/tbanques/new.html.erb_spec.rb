require 'rails_helper'

RSpec.describe "tbanques/new", :type => :view do
  before(:each) do
    assign(:tbanque, Tbanque.new(
      :banque => nil,
      :type_rv => "MyString",
      :montant => "9.99",
      :porteur => "MyString"
    ))
  end

  it "renders new tbanque form" do
    render

    assert_select "form[action=?][method=?]", tbanques_path, "post" do

      assert_select "input#tbanque_banque_id[name=?]", "tbanque[banque_id]"

      assert_select "input#tbanque_type_rv[name=?]", "tbanque[type_rv]"

      assert_select "input#tbanque_montant[name=?]", "tbanque[montant]"

      assert_select "input#tbanque_porteur[name=?]", "tbanque[porteur]"
    end
  end
end
