require 'spec_helper'

describe "kit_staffs/index" do
  before(:each) do
    assign(:kit_staffs, [
      stub_model(KitStaff,
        :kit_id => 1,
        :staff_id => 2,
        :staff_group_id => 3
      ),
      stub_model(KitStaff,
        :kit_id => 1,
        :staff_id => 2,
        :staff_group_id => 3
      )
    ])
  end

  it "renders a list of kit_staffs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
