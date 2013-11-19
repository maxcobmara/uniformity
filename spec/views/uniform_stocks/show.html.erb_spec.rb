require 'spec_helper'

describe "uniform_stocks/show" do
  before(:each) do
    @uniform_stock = assign(:uniform_stock, stub_model(UniformStock,
      :uniform_id => 1,
      :size => "9.99",
      :category => "Category",
      :max_quantity => 2,
      :min_quantity => 3,
      :unit_type_id => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/9.99/)
    rendered.should match(/Category/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
  end
end
