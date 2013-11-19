require 'spec_helper'

describe "kit_uniforms/show" do
  before(:each) do
    @kit_uniform = assign(:kit_uniform, stub_model(KitUniform,
      :kit_id => 1,
      :uniform_id => 2,
      :quantity => 3,
      :notes => "Notes"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Notes/)
  end
end
