require 'spec_helper'

describe "uniform_stock_issues/new" do
  before(:each) do
    assign(:uniform_stock_issue, stub_model(UniformStockIssue,
      :stock_id => 1,
      :issued_to => 1,
      :issued_by => 1,
      :quantity => 1,
      :document_id => 1
    ).as_new_record)
  end

  it "renders new uniform_stock_issue form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", uniform_stock_issues_path, "post" do
      assert_select "input#uniform_stock_issue_stock_id[name=?]", "uniform_stock_issue[stock_id]"
      assert_select "input#uniform_stock_issue_issued_to[name=?]", "uniform_stock_issue[issued_to]"
      assert_select "input#uniform_stock_issue_issued_by[name=?]", "uniform_stock_issue[issued_by]"
      assert_select "input#uniform_stock_issue_quantity[name=?]", "uniform_stock_issue[quantity]"
      assert_select "input#uniform_stock_issue_document_id[name=?]", "uniform_stock_issue[document_id]"
    end
  end
end
