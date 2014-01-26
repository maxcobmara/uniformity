class UniformStockIssue < ActiveRecord::Base
  belongs_to :uniform_stock, :foreign_key => 'stock_id'
  belongs_to :issuer, :class_name => 'Staff', :foreign_key => 'issued_by'
  belongs_to :receiver, :class_name => 'Staff', :foreign_key => 'issued_to'
  validates_length_of :quantity,  :maximum => 5,
                                  :message => "maximum is 5 characters"
  validates       :stock_id, presence: true
end
