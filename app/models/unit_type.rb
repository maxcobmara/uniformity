class UnitType < ActiveRecord::Base
  has_many :staff_measurement, dependent: :nullify 
  has_many :uniform_stocks, dependent: :nullify
end
