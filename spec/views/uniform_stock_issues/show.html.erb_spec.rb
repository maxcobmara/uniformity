require 'spec_helper'

describe "uniform_stock_issues/show" do
  before(:each) do
    @uniform_stock_issue = assign(:uniform_stock_issue, stub_model(UniformStockIssue,
      :stock_id => 1,
      :issued_to => 2,
      :issued_by => 3,
      :quantity => 4,
      :document_id => 5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/5/)
  end
end
