class Staff < ActiveRecord::Base
  has_many :staff_measurements, dependent: :destroy 
  accepts_nested_attributes_for :staff_measurements, allow_destroy: true, reject_if: proc { |staff_measurements| staff_measurements[:uniform_id].blank? }
  has_many :kit_staffs, dependent: :destroy
  accepts_nested_attributes_for :kit_staffs, allow_destroy: true, reject_if: proc { |kit_staffs| kit_staffs[:kit_id].blank? }
  belongs_to :rank, :foreign_key => 'rank_id'
end
