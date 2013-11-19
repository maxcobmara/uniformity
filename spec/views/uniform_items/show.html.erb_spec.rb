require 'spec_helper'

describe "uniform_items/show" do
  before(:each) do
    @uniform_item = assign(:uniform_item, stub_model(UniformItem,
      :code => "Code",
      :name => "Name",
      :notes => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Code/)
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
  end
end
