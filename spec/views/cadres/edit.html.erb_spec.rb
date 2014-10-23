require 'rails_helper'

RSpec.describe "cadres/edit", :type => :view do
  before(:each) do
    @cadre = assign(:cadre, Cadre.create!(
      :numerobaguete => "MyString",
      :info => "MyText"
    ))
  end

  it "renders the edit cadre form" do
    render

    assert_select "form[action=?][method=?]", cadre_path(@cadre), "post" do

      assert_select "input#cadre_numerobaguete[name=?]", "cadre[numerobaguete]"

      assert_select "textarea#cadre_info[name=?]", "cadre[info]"
    end
  end
end
