class UnitType < ActiveRecord::Base
  has_many :staff_measurement, dependent: :nullify 
end
