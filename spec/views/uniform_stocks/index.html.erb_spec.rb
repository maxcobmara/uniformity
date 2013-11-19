require 'spec_helper'

describe "uniform_stocks/index" do
  before(:each) do
    assign(:uniform_stocks, [
      stub_model(UniformStock,
        :uniform_id => 1,
        :size => "9.99",
        :category => "Category",
        :max_quantity => 2,
        :min_quantity => 3,
        :unit_type_id => 4
      ),
      stub_model(UniformStock,
        :uniform_id => 1,
        :size => "9.99",
        :category => "Category",
        :max_quantity => 2,
        :min_quantity => 3,
        :unit_type_id => 4
      )
    ])
  end

  it "renders a list of uniform_stocks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
