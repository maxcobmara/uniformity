class UniformStock < ActiveRecord::Base
  has_many :uniform_stock_receiveds, dependent: :destroy
  has_many :uniform_stock_issues, dependent: :destroy
  belongs_to :uniform_item, :foreign_key => 'uniform_id'
  belongs_to :unit_type, :foreign_key => 'unit_type_id'
  
  def uniform_stock_details
    "#{uniform_item.uniform_details}"+" - "+"#{size}" +"#{category}"
  end
  
end
