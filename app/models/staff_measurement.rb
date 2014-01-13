class StaffMeasurement < ActiveRecord::Base
  belongs_to :staff
  belongs_to :uniform_item,  :foreign_key => 'uniform_id'
  belongs_to :unit_type, :foreign_key => 'unit_type_id'
end
