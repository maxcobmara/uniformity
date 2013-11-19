require 'spec_helper'

describe "uniform_stocks/edit" do
  before(:each) do
    @uniform_stock = assign(:uniform_stock, stub_model(UniformStock,
      :uniform_id => 1,
      :size => "9.99",
      :category => "MyString",
      :max_quantity => 1,
      :min_quantity => 1,
      :unit_type_id => 1
    ))
  end

  it "renders the edit uniform_stock form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", uniform_stock_path(@uniform_stock), "post" do
      assert_select "input#uniform_stock_uniform_id[name=?]", "uniform_stock[uniform_id]"
      assert_select "input#uniform_stock_size[name=?]", "uniform_stock[size]"
      assert_select "input#uniform_stock_category[name=?]", "uniform_stock[category]"
      assert_select "input#uniform_stock_max_quantity[name=?]", "uniform_stock[max_quantity]"
      assert_select "input#uniform_stock_min_quantity[name=?]", "uniform_stock[min_quantity]"
      assert_select "input#uniform_stock_unit_type_id[name=?]", "uniform_stock[unit_type_id]"
    end
  end
end
