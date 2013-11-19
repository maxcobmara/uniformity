require 'spec_helper'

describe "uniform_stock_receiveds/show" do
  before(:each) do
    @uniform_stock_received = assign(:uniform_stock_received, stub_model(UniformStockReceived,
      :stock_id => 1,
      :quantity => 2,
      :size => "9.99",
      :received_by => 3,
      :contract_id => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/9.99/)
    rendered.should match(/3/)
    rendered.should match(/4/)
  end
end
