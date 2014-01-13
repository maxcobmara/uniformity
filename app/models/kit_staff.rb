class KitStaff < ActiveRecord::Base
  belongs_to :kit, :foreign_key => 'kit_id'
end
