require 'spec_helper'

describe "uniform_stock_issues/index" do
  before(:each) do
    assign(:uniform_stock_issues, [
      stub_model(UniformStockIssue,
        :stock_id => 1,
        :issued_to => 2,
        :issued_by => 3,
        :quantity => 4,
        :document_id => 5
      ),
      stub_model(UniformStockIssue,
        :stock_id => 1,
        :issued_to => 2,
        :issued_by => 3,
        :quantity => 4,
        :document_id => 5
      )
    ])
  end

  it "renders a list of uniform_stock_issues" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
end
