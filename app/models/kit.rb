class Kit < ActiveRecord::Base
  
  before_save     :set_combo_code
  
  has_ancestry    :cache_depth => true
  has_many        :uniforms, through: :kit_uniforms
  
  validates :code, :name, presence: true
  
  def set_combo_code
    if ancestry_depth == 0
      self.combo_code = code
    elsif ancestry_depth == 1
      self.combo_code = parent.combo_code + "-" + code
    else
      self.combo_code = parent.combo_code + code
    end
  end
  
  
  
  def kit_details
    "#{combo_code} | #{name}"
  end
end
