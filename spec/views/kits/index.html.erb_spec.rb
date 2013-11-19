require 'spec_helper'

describe "kits/index" do
  before(:each) do
    assign(:kits, [
      stub_model(Kit,
        :code => "Code",
        :combo_code => "Combo Code",
        :name => "Name",
        :ancestry => "Ancestry",
        :ancestry_depth => 1
      ),
      stub_model(Kit,
        :code => "Code",
        :combo_code => "Combo Code",
        :name => "Name",
        :ancestry => "Ancestry",
        :ancestry_depth => 1
      )
    ])
  end

  it "renders a list of kits" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Combo Code".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Ancestry".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
