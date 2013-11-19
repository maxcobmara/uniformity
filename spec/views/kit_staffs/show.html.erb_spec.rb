require 'spec_helper'

describe "kit_staffs/show" do
  before(:each) do
    @kit_staff = assign(:kit_staff, stub_model(KitStaff,
      :kit_id => 1,
      :staff_id => 2,
      :staff_group_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
