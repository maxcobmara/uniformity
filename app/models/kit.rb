class Kit < ActiveRecord::Base
  
  before_save     :set_combo_code
  before_destroy  :check_kit_uniforms, :check_kit_staffs 
  
  has_ancestry    :cache_depth => true
  
  has_many        :kit_uniforms, :dependent => :destroy 	#kit cannot be removed if kit_uniform exist
  accepts_nested_attributes_for :kit_uniforms, allow_destroy: true, reject_if: proc { |kit_uniforms| kit_uniforms[:uniform_id].blank? }
  
  has_many        :uniform_items, through: :kit_uniforms
 
  has_many        :kit_staffs #kit cannot be removed if kit_staffs exist
  has_many        :staffs, through: :kit_staffs
   
  validates       :code, :name, presence: true
  validate        :kit_uniforms_must_exist_if_master_kit
  after_save      :remove_master_if_last_uniform_item_deleted
  
  def remove_master_if_last_uniform_item_deleted
     if ancestry_depth == 0 && kit_uniforms.blank?
       self.destroy
     end
  end
  
  def kit_uniforms_must_exist_if_master_kit
    if ancestry_depth == 0 && kit_uniforms.blank?
      errors.add(:base, 'Master kit must have at least one uniform item')
    end
  end
  
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
  
  private 
  
    def check_kit_uniforms 
      kit_ids = KitUniform.all.map(&:kit_id)
      if kit_ids.include?(id)
        return false
      end
    end
  
    def check_kit_staffs
      kit_ids = KitStaff.all.map(&:kit_id)
      if kit_ids.include?(id)
        return false
      end
    end
    
end
