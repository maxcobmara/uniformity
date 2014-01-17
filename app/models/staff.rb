class Staff < ActiveRecord::Base
  has_many :staff_measurements, dependent: :destroy 
  accepts_nested_attributes_for :staff_measurements, allow_destroy: true, reject_if: proc { |staff_measurements| staff_measurements[:uniform_id].blank? }
  has_many :kit_staffs, dependent: :destroy
  accepts_nested_attributes_for :kit_staffs, allow_destroy: true, reject_if: proc { |kit_staffs| kit_staffs[:kit_id].blank? }
  belongs_to :rank, :foreign_key => 'rank_id'
  has_many :uniform_stock_receiveds
  has_many :stock_issuer ,:class_name => 'uniform_stock_issues', :foreign_key => 'issued_by'
  has_many :stock_receiver ,:class_name => 'uniform_stock_issues', :foreign_key => 'issued_to'
end
