class UniformItem < ActiveRecord::Base
  has_many :kit_uniforms
  has_many :staff_measurements, dependent: :nullify
  
  validates_uniqueness_of :name, :scope => :code
  
  
  def uniform_details
    "#{code} | #{name}" 
  end
end
