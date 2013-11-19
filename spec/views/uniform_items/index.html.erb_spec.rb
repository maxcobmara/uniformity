require 'spec_helper'

describe "uniform_items/index" do
  before(:each) do
    assign(:uniform_items, [
      stub_model(UniformItem,
        :code => "Code",
        :name => "Name",
        :notes => "MyText"
      ),
      stub_model(UniformItem,
        :code => "Code",
        :name => "Name",
        :notes => "MyText"
      )
    ])
  end

  it "renders a list of uniform_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
