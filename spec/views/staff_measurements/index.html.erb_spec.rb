require 'spec_helper'

describe "staff_measurements/index" do
  before(:each) do
    assign(:staff_measurements, [
      stub_model(StaffMeasurement,
        :staff_id => 1,
        :uniform_id => 2,
        :measurement_type => "Measurement Type",
        :value => "9.99",
        :unit_type_id => 3
      ),
      stub_model(StaffMeasurement,
        :staff_id => 1,
        :uniform_id => 2,
        :measurement_type => "Measurement Type",
        :value => "9.99",
        :unit_type_id => 3
      )
    ])
  end

  it "renders a list of staff_measurements" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Measurement Type".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
