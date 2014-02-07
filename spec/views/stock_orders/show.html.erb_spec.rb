require 'spec_helper'

describe "stock_orders/show" do
  before(:each) do
    @stock_order = assign(:stock_order, stub_model(StockOrder,
      :stock_id => 1,
      :quantity => 2,
      :unit_type_id => 3,
      :company_id => 4,
      :remark => "Remark"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/Remark/)
  end
end
