class UniformStockReceived < ActiveRecord::Base
  before_save :save_my_vars
  belongs_to :uniform_stock, :foreign_key => 'stock_id'
  belongs_to :receiver, :class_name => 'Staff', :foreign_key => 'received_by'
  belongs_to :contract, :foreign_key => 'contract_id'
  validates_length_of :quantity,  :maximum => 5,
                                  :message => "maximum is 5 characters"
  validates_length_of :size,      :maximum => 15,
                                  :message => "maximum is 15 characters"
  validates :stock_id, :received_on, presence: true
  
  def save_my_vars
	latest_rvno = UniformStockReceived.last.rv_no
	if id == nil
		if latest_rvno.nil?
			self.rv_no = format_rv+"-1"
		else
			a=(latest_rvno.split("-")[1]).to_i+1
			self.rv_no = format_rv+"-"+a.to_s
		end
	end
  end
  
  def format_rv
	"RV"+received_on.strftime("%Y%m")
  end
end
