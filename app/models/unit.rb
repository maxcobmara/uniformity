class Unit < ActiveRecord::Base
  before_save :set_combo_code
  has_ancestry :cache_depth => true
  
  has_many :subunits, class_name: "Unit", foreign_key: 'parent_id'
  belongs_to :parent, class_name: "Unit", foreign_key: 'parent_id'
  
  def set_combo_code
    if ancestry_depth == 0
      self.combo_code = code
    elsif ancestry_depth == 1 || ancestry_depth == 2 || ancestry_depth == 3 || ancestry_depth == 4
      self.combo_code = parent.combo_code + "-" + code
    else
      self.combo_code = parent.combo_code + code
    end
  end
end
