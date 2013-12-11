class UniformItem < ActiveRecord::Base
  has_many :kit_uniforms
  def uniform_details
    "#{code} | #{name}" 
  end
end
