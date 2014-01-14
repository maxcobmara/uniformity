class UniformItem < ActiveRecord::Base
  has_many :kit_uniforms
  has_many :staff_measurements, dependent: :nullify 
  def uniform_details
    "#{code} | #{name}" 
  end
end
