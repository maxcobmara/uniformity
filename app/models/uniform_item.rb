class UniformItem < ActiveRecord::Base
  has_many :kit_uniforms
  has_many :staff_measurements, dependent: :nullify
  has_many :uniform_stocks, dependent: :destroy  #example: 1 uniform item may have multiple sizes
  
  validates_uniqueness_of :name, :scope => :code
  
  
  def uniform_details
    "#{code} | #{name}" 
  end
end
