class UniformStockIssue < ActiveRecord::Base
  before_save :save_my_vars
  belongs_to :uniform_stock, :foreign_key => 'stock_id'
  belongs_to :issuer, :class_name => 'Staff', :foreign_key => 'issued_by'
  belongs_to :receiver, :class_name => 'Staff', :foreign_key => 'issued_to'
  validates_length_of :quantity,  :maximum => 5,
                                  :message => "maximum is 5 characters"
  validates :stock_id, :issued_on, presence: true
  
 def save_my_vars
	latest_ivno = UniformStockIssue.last.iv_no
	if id == nil
		if latest_ivno.nil?
			self.iv_no = format_iv+"-1"
		else
			a=(latest_ivno.split("-")[1]).to_i+1
			self.iv_no = format_iv+"-"+a.to_s
		end
	end
  end
  
  def format_iv
	"IV"+issued_on.strftime("%Y%m")
  end
end
