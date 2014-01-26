class KitStaff < ActiveRecord::Base
  belongs_to :kit, :foreign_key => 'kit_id'
  belongs_to :staff, :foreign_key => 'staff_id'
end
