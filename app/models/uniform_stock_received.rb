class UniformStockReceived < ActiveRecord::Base
  belongs_to :uniform_stock, :foreign_key => 'stock_id'
  belongs_to :receiver, :class_name => 'Staff', :foreign_key => 'received_by'
  belongs_to :contract, :foreign_key => 'contract_id'
  validates_length_of :quantity,  :maximum => 5,
                                  :message => "maximum is 5 characters"
  validates_length_of :size,      :maximum => 15,
                                  :message => "maximum is 15 characters"
  validates       :stock_id, presence: true
end
