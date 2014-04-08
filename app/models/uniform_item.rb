class UniformItem < ActiveRecord::Base
  has_many :kit_uniforms
  has_many :staff_measurements, dependent: :nullify, :foreign_key => 'uniform_id' #FK required to be include here, as default no been used (default=uniform_item_id)
  has_many :uniform_stocks, dependent: :destroy, :foreign_key => 'uniform_id'  #example: 1 uniform item may have multiple sizes
  
  validates_uniqueness_of :name, :scope => :code
  
  def uniform_details
    "#{code} | #{name}" 
  end
end
