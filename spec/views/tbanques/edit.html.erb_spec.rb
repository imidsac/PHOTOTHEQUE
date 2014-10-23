require 'rails_helper'

RSpec.describe "tbanques/edit", :type => :view do
  before(:each) do
    @tbanque = assign(:tbanque, Tbanque.create!(
      :banque => nil,
      :type_rv => "MyString",
      :montant => "9.99",
      :porteur => "MyString"
    ))
  end

  it "renders the edit tbanque form" do
    render

    assert_select "form[action=?][method=?]", tbanque_path(@tbanque), "post" do

      assert_select "input#tbanque_banque_id[name=?]", "tbanque[banque_id]"

      assert_select "input#tbanque_type_rv[name=?]", "tbanque[type_rv]"

      assert_select "input#tbanque_montant[name=?]", "tbanque[montant]"

      assert_select "input#tbanque_porteur[name=?]", "tbanque[porteur]"
    end
  end
end
