require 'spec_helper'

describe "kit_staffs/new" do
  before(:each) do
    assign(:kit_staff, stub_model(KitStaff,
      :kit_id => 1,
      :staff_id => 1,
      :staff_group_id => 1
    ).as_new_record)
  end

  it "renders new kit_staff form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", kit_staffs_path, "post" do
      assert_select "input#kit_staff_kit_id[name=?]", "kit_staff[kit_id]"
      assert_select "input#kit_staff_staff_id[name=?]", "kit_staff[staff_id]"
      assert_select "input#kit_staff_staff_group_id[name=?]", "kit_staff[staff_group_id]"
    end
  end
end
