class StockOrder < ActiveRecord::Base
  belongs_to :uniform_stock, :foreign_key => "stock_id"
  belongs_to :unit_type, :foreign_key => "unit_type_id"
  belongs_to :supplier, :class_name => "Company", :foreign_key => "company_id"
  validates_presence_of :stock_id
end
