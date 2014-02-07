class UniformStock < ActiveRecord::Base
  has_many :uniform_stock_receiveds#, dependent: :destroy if no stock received --> destry uniformstock failed
  has_many :uniform_stock_issues#, dependent: :destroy - same as above
  has_many :stock_orders
  belongs_to :uniform_item, :foreign_key => 'uniform_id'
  belongs_to :unit_type, :foreign_key => 'unit_type_id'

  validates :uniform_id, presence: true
  
  def uniform_stock_details
    "#{uniform_item.uniform_details}"+" - "+"#{size}" +"#{category}"
  end
  
  def self.total_required(uni_id)
    item = KitUniform.where('uniform_id=?',uni_id)[0]
    kit_id = item.kit_id
    staff_ids = KitStaff.where('kit_id=?',kit_id).map(&:staff_id)
    staffs_rec =Staff.where('id IN(?)',staff_ids)
    total_required=0
    for staff in staffs_rec
      total_required+= item.kit_qty(staff.gender,staff.rank.rate,staff.rank.shortname)  #refer KitUniform model
    end
    return total_required
  end
  
  def self.receive(uni_id)
    UniformStockReceived.where('stock_id IN(?)', UniformStock.where('uniform_id=?',uni_id).map(&:id)).sum(:quantity)
  end
  
  def self.issue(uni_id)
     UniformStockIssue.where('stock_id IN(?)', UniformStock.where('uniform_id=?',uni_id).map(&:id)).sum(:quantity)
  end
  
end
