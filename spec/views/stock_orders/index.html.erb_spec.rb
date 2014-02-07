require 'spec_helper'

describe "stock_orders/index" do
  before(:each) do
    assign(:stock_orders, [
      stub_model(StockOrder,
        :stock_id => 1,
        :quantity => 2,
        :unit_type_id => 3,
        :company_id => 4,
        :remark => "Remark"
      ),
      stub_model(StockOrder,
        :stock_id => 1,
        :quantity => 2,
        :unit_type_id => 3,
        :company_id => 4,
        :remark => "Remark"
      )
    ])
  end

  it "renders a list of stock_orders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Remark".to_s, :count => 2
  end
end
