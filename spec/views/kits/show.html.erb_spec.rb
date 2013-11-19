require 'spec_helper'

describe "kits/show" do
  before(:each) do
    @kit = assign(:kit, stub_model(Kit,
      :code => "Code",
      :combo_code => "Combo Code",
      :name => "Name",
      :ancestry => "Ancestry",
      :ancestry_depth => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Code/)
    rendered.should match(/Combo Code/)
    rendered.should match(/Name/)
    rendered.should match(/Ancestry/)
    rendered.should match(/1/)
  end
end
