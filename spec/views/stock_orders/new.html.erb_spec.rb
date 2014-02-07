require 'spec_helper'

describe "stock_orders/new" do
  before(:each) do
    assign(:stock_order, stub_model(StockOrder,
      :stock_id => 1,
      :quantity => 1,
      :unit_type_id => 1,
      :company_id => 1,
      :remark => "MyString"
    ).as_new_record)
  end

  it "renders new stock_order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", stock_orders_path, "post" do
      assert_select "input#stock_order_stock_id[name=?]", "stock_order[stock_id]"
      assert_select "input#stock_order_quantity[name=?]", "stock_order[quantity]"
      assert_select "input#stock_order_unit_type_id[name=?]", "stock_order[unit_type_id]"
      assert_select "input#stock_order_company_id[name=?]", "stock_order[company_id]"
      assert_select "input#stock_order_remark[name=?]", "stock_order[remark]"
    end
  end
end
