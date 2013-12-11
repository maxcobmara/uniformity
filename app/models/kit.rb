class Kit < ActiveRecord::Base
  has_many :kit_uniforms
  def kit_details
    "#{combo_code} | #{name}"
  end
end
