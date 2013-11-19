require 'spec_helper'

describe "kits/new" do
  before(:each) do
    assign(:kit, stub_model(Kit,
      :code => "MyString",
      :combo_code => "MyString",
      :name => "MyString",
      :ancestry => "MyString",
      :ancestry_depth => 1
    ).as_new_record)
  end

  it "renders new kit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", kits_path, "post" do
      assert_select "input#kit_code[name=?]", "kit[code]"
      assert_select "input#kit_combo_code[name=?]", "kit[combo_code]"
      assert_select "input#kit_name[name=?]", "kit[name]"
      assert_select "input#kit_ancestry[name=?]", "kit[ancestry]"
      assert_select "input#kit_ancestry_depth[name=?]", "kit[ancestry_depth]"
    end
  end
end
