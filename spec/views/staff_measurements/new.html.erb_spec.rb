require 'spec_helper'

describe "staff_measurements/new" do
  before(:each) do
    assign(:staff_measurement, stub_model(StaffMeasurement,
      :staff_id => 1,
      :uniform_id => 1,
      :measurement_type => "MyString",
      :value => "9.99",
      :unit_type_id => 1
    ).as_new_record)
  end

  it "renders new staff_measurement form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", staff_measurements_path, "post" do
      assert_select "input#staff_measurement_staff_id[name=?]", "staff_measurement[staff_id]"
      assert_select "input#staff_measurement_uniform_id[name=?]", "staff_measurement[uniform_id]"
      assert_select "input#staff_measurement_measurement_type[name=?]", "staff_measurement[measurement_type]"
      assert_select "input#staff_measurement_value[name=?]", "staff_measurement[value]"
      assert_select "input#staff_measurement_unit_type_id[name=?]", "staff_measurement[unit_type_id]"
    end
  end
end
