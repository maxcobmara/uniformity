class UniformStock < ActiveRecord::Base
  before_destroy  :check_uni_stock_receiveds, :check_uni_stock_issues
  has_many :uniform_stock_receiveds	
  has_many :uniform_stock_issues	
  has_many :stock_orders
  belongs_to :uniform_item, :foreign_key => 'uniform_id'
  belongs_to :unit_type, :foreign_key => 'unit_type_id'

  validates :uniform_id, presence: true
  
  def uniform_stock_details
    "#{uniform_item.uniform_details}"+" - "+"#{size}" +"#{category}"
  end
  
  def self.total_required(uni_id)
	#Sample : uniform_id = 659 (Testing Item..)-> kit_id = 114
	#Sample : uniform_id = 85 (Singlet)-> kit_ids = [51,101] -> qty of descendants for 51 => 20 & descendants for 101 = [102, 103]
	items = KitUniform.where('uniform_id=?',uni_id)		#if uniform 659, check fr here
	kit_ids = items.pluck(:kit_id)
	total_required=0
	items.each_with_index do |item, ind|
		staffs_rec = UniformStock.staffs_for_kits(kit_ids[ind])
		for staff in staffs_rec
			total_required+= (item.kit_qty(staff.gender,staff.rank.rate,staff.rank.shortname)).to_i  #refer KitUniform model
		end
	end
	return total_required 
	##compulsory - must make sure KIT ASSIGNED accordingly...certain KIT only assigned to certain staff based on THEIR rank, position@(expertise/branch)
  end
  
  def self.staffs_for_kits(kit_id)
	staff_ids = KitStaff.where('kit_id=?',kit_id).pluck(:staff_id)
	staffs = Staff.where('id IN(?)',staff_ids)
	if staff_ids.count==0 											#if kit not exist in kit_staff, kit must be somewhere in its descendants
		descendant_kit_ids = Kit.find(kit_id).descendant_ids 		#if kit_id=101, total_required=2, if kit_id=51, total_required=6
		staff_ids = KitStaff.where('kit_id IN (?)',descendant_kit_ids).pluck(:staff_id).uniq
		staffs = Staff.where('id IN(?)',staff_ids)
	end
	staffs
  end
  
  def self.receive(uni_id)
    UniformStockReceived.where('stock_id IN(?)', UniformStock.where('uniform_id=?',uni_id).map(&:id)).sum(:quantity)
  end
  
  def self.issue(uni_id)
     UniformStockIssue.where('stock_id IN(?)', UniformStock.where('uniform_id=?',uni_id).map(&:id)).sum(:quantity)
  end
  
  private 
  
    def check_uni_stock_receiveds
	  stock_ids = UniformStockReceived.all.map(&:stock_id) 
      if stock_ids.include?(id)
        return false
      end
    end
	
	def check_uni_stock_issues
	  stock_ids = UniformStockIssue.all.map(&:stock_id)  
      if stock_ids.include?(id)
        return false
      end
    end
end
