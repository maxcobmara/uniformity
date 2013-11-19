require 'spec_helper'

describe "uniform_stock_receiveds/index" do
  before(:each) do
    assign(:uniform_stock_receiveds, [
      stub_model(UniformStockReceived,
        :stock_id => 1,
        :quantity => 2,
        :size => "9.99",
        :received_by => 3,
        :contract_id => 4
      ),
      stub_model(UniformStockReceived,
        :stock_id => 1,
        :quantity => 2,
        :size => "9.99",
        :received_by => 3,
        :contract_id => 4
      )
    ])
  end

  it "renders a list of uniform_stock_receiveds" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
