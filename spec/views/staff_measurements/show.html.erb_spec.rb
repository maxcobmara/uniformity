require 'spec_helper'

describe "staff_measurements/show" do
  before(:each) do
    @staff_measurement = assign(:staff_measurement, stub_model(StaffMeasurement,
      :staff_id => 1,
      :uniform_id => 2,
      :measurement_type => "Measurement Type",
      :value => "9.99",
      :unit_type_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Measurement Type/)
    rendered.should match(/9.99/)
    rendered.should match(/3/)
  end
end
