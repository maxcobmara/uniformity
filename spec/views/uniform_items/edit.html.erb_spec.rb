require 'spec_helper'

describe "uniform_items/edit" do
  before(:each) do
    @uniform_item = assign(:uniform_item, stub_model(UniformItem,
      :code => "MyString",
      :name => "MyString",
      :notes => "MyText"
    ))
  end

  it "renders the edit uniform_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", uniform_item_path(@uniform_item), "post" do
      assert_select "input#uniform_item_code[name=?]", "uniform_item[code]"
      assert_select "input#uniform_item_name[name=?]", "uniform_item[name]"
      assert_select "textarea#uniform_item_notes[name=?]", "uniform_item[notes]"
    end
  end
end
