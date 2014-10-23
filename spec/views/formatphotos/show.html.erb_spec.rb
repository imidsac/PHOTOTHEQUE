require 'rails_helper'

RSpec.describe "formatphotos/show", :type => :view do
  before(:each) do
    @formatphoto = assign(:formatphoto, Formatphoto.create!(
      :dimention => "Dimention",
      :info => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Dimention/)
    expect(rendered).to match(/MyText/)
  end
end
