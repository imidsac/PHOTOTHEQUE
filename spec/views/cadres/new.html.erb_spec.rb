require 'rails_helper'

RSpec.describe "cadres/new", :type => :view do
  before(:each) do
    assign(:cadre, Cadre.new(
      :numerobaguete => "MyString",
      :info => "MyText"
    ))
  end

  it "renders new cadre form" do
    render

    assert_select "form[action=?][method=?]", cadres_path, "post" do

      assert_select "input#cadre_numerobaguete[name=?]", "cadre[numerobaguete]"

      assert_select "textarea#cadre_info[name=?]", "cadre[info]"
    end
  end
end
