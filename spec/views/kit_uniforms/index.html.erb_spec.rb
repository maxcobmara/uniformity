require 'spec_helper'

describe "kit_uniforms/index" do
  before(:each) do
    assign(:kit_uniforms, [
      stub_model(KitUniform,
        :kit_id => 1,
        :uniform_id => 2,
        :quantity => 3,
        :notes => "Notes"
      ),
      stub_model(KitUniform,
        :kit_id => 1,
        :uniform_id => 2,
        :quantity => 3,
        :notes => "Notes"
      )
    ])
  end

  it "renders a list of kit_uniforms" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Notes".to_s, :count => 2
  end
end
