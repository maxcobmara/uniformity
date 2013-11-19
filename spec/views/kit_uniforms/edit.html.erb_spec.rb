require 'spec_helper'

describe "kit_uniforms/edit" do
  before(:each) do
    @kit_uniform = assign(:kit_uniform, stub_model(KitUniform,
      :kit_id => 1,
      :uniform_id => 1,
      :quantity => 1,
      :notes => "MyString"
    ))
  end

  it "renders the edit kit_uniform form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", kit_uniform_path(@kit_uniform), "post" do
      assert_select "input#kit_uniform_kit_id[name=?]", "kit_uniform[kit_id]"
      assert_select "input#kit_uniform_uniform_id[name=?]", "kit_uniform[uniform_id]"
      assert_select "input#kit_uniform_quantity[name=?]", "kit_uniform[quantity]"
      assert_select "input#kit_uniform_notes[name=?]", "kit_uniform[notes]"
    end
  end
end
