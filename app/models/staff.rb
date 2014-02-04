class Staff < ActiveRecord::Base
  before_save :assign_default_provision
  
  has_many :staff_measurements, dependent: :destroy 
  accepts_nested_attributes_for :staff_measurements, allow_destroy: true, reject_if: proc { |staff_measurements| staff_measurements[:uniform_id].blank? }
  has_many :kit_staffs, dependent: :destroy
  accepts_nested_attributes_for :kit_staffs, allow_destroy: true, reject_if: proc { |kit_staffs| kit_staffs[:kit_id].blank? }
  belongs_to :rank, :foreign_key => 'rank_id'
  has_many :uniform_stock_receiveds
  has_many :stock_issuer ,:class_name => 'uniform_stock_issues', :foreign_key => 'issued_by'
  has_many :stock_receiver ,:class_name => 'uniform_stock_issues', :foreign_key => 'issued_to'
  belongs_to :position, :foreign_key => 'position_id'
  belongs_to :expertise, :foreign_key => 'expertise_id'

  validates_presence_of :id_no, :name, :rank_id, :gender, :religion
  validates_presence_of :position_id , :if => :rank_officer?
  validates_presence_of :expertise_id, :if => :rank_staff?
  
  def rank_officer?
    !rank_id.nil? && rank.rate > 2
  end
  
  def rank_staff?
    !rank_id.nil? && rank.rate < 3
  end
  
  def assign_default_provision
    if (!id.nil?) || (!id.blank?)
      rank_rate = rank.rate  
      rank_name = rank.shortname
      default_kit_ids = KitUniform.group_by_rank(rank_rate,gender,rank_name,religion)
      for default_kit_id in default_kit_ids #[53,54] for test #[113] for Pegawai
        if !KitStaff.where('staff_id=?',id).map(&:kit_id).include?(default_kit_id)  #if !KitStaff.where('id=?',id).map(&:kit_id).include?(default_kit_id)
          staff_rec = Staff.find(id)
          staff_kit_staff = staff_rec.kit_staffs.new
          staff_kit_staff.staff_id = id
          staff_kit_staff.kit_id = default_kit_id
          staff_kit_staff.save
        end
      end
    end
  end
  
  def staff_details
    "#{id_no} " + "#{name}"
  end
  
  GENDER = [
  #  Displayed       stored in db
          [ "Male",  1],
          [ "Female", 2]
  ]

  RELIGION = [
  #  Displayed       stored in db
          ["Islam",   1],
          ["Sikh",    2],
          ["Others",  3]
  ]
   
end
