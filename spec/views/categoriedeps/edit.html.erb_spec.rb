require 'rails_helper'

RSpec.describe "categoriedeps/edit", :type => :view do
  before(:each) do
    @categoriedep = assign(:categoriedep, Categoriedep.create!(
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit categoriedep form" do
    render

    assert_select "form[action=?][method=?]", categoriedep_path(@categoriedep), "post" do

      assert_select "input#categoriedep_name[name=?]", "categoriedep[name]"

      assert_select "input#categoriedep_description[name=?]", "categoriedep[description]"
    end
  end
end
