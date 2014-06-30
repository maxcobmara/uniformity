class Staff < ActiveRecord::Base
  before_save :assign_default_provision
  
  has_many :staff_measurements, dependent: :destroy 
  accepts_nested_attributes_for :staff_measurements, allow_destroy: true, reject_if: proc { |staff_measurements| staff_measurements[:uniform_id].blank? }
  
  has_many :kit_staffs, dependent: :destroy
  accepts_nested_attributes_for :kit_staffs, allow_destroy: true, reject_if: proc { |kit_staffs| kit_staffs[:kit_id].blank? }
  
  has_many :kits, through: :kit_staffs
  has_many :uniform_items, through: :kits
  
  
  has_many :uniform_stock_receiveds
  has_many :stock_issuer ,:class_name => 'uniform_stock_issues', :foreign_key => 'issued_by'
  has_many :stock_receiver ,:class_name => 'uniform_stock_issues', :foreign_key => 'issued_to'
  
  belongs_to :rank, :foreign_key => 'rank_id'
  belongs_to :position, :foreign_key => 'position_id'
  belongs_to :expertise, :foreign_key => 'expertise_id'

  validates_presence_of :id_no, :name, :rank_id, :gender, :religion #gender & religion - how?
  validates_presence_of :position_id , :if => :rank_officer?
  validates_presence_of :expertise_id, :if => :rank_staff?
  validates_uniqueness_of :id_no
  
  attr_accessor :rank_excel, :position_excel, :gender_excel, :religion_excel #fr excel
  
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
    "#{id_no} " + "#{name}".gsub(/\w+/, &:capitalize) 
  end
  
  def self.import(file) 
    spreadsheet = open_spreadsheet(file)     
    excel_reg_nos=[]
    staffs=[]
    header = spreadsheet.row(1)
    staff_positions=[]
   
    #decoration = find_by_id(row["id"]) || new
    (5..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      staff = find_by_id(row["id_no"]) || new 
      staff.attributes = row.to_hash.slice("id_no","rank_excel","name","position_excel","gender_excel","religion_excel") 
 
      # retrieve fr excel, assign position_id according to drop down
      unless (staff.position_excel.nil? || staff.position_excel.blank?)
        staff.position_id = Position.get_position(staff.position_excel,staff_positions)    
        staff_positions<<staff.position_excel if !Position.all.pluck(:name).include?(staff.position_excel)
      end
 
      # retrieve fr excel, assign rank_id according to drop down
      unless (staff.rank_excel.nil? || staff.rank_excel.blank?)
        staff.rank_id = Rank.get_rank(staff.rank_excel)         
      end
      
      #retrieve fr excel, assign gender accordingly
      unless (staff.gender_excel.nil? || staff.gender_excel.blank?)
        staff.gender = 1 if staff.gender_excel.downcase == "male"
        staff.gender = 2 if staff.gender_excel.downcase == "female"      
      end
      
      #retrieve fr excel, assign religion accordingly
      unless (staff.religion_excel.nil? || staff.religion_excel.blank?)
        staff.religion = 1 if staff.religion_excel.downcase == "islam"
        staff.religion = 2 if staff.religion_excel.downcase == "sikh"
        staff.religion = 3 if staff.religion_excel.downcase == "others"              
      end    

      #excel_reg_nos<<staff.id_no
      #staffs<<staff 
      
      exist_reg_no = excel_reg_nos.include?(staff.id_no)
      unless (staff.id_no.nil? || staff.id_no.blank? || staff.id_no == " " || staff.id_no == "-") 
        if !exist_reg_no
          excel_reg_nos<<staff.id_no
          if staff.id_no.is_a? Numeric
            staff.id_no = staff.id_no.to_i
          end
          staffs<<staff  #all valid one...will be assign to array & send for data saving
        end
      end  
      
    end 
    return staffs
  end
  

  def self.open_spreadsheet(file) 
    case File.extname(file.original_filename) 
      when ".csv" then Roo::Csv.new(file.path, nil, :ignore) 
      when ".xls" then Roo::Excel.new(file.path, nil, :ignore) 
      when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore) 
      else raise "Unknown file type: #{file.original_filename}" 
    end
  end 
    
  def self.get_invalid(staff_list)
    @invalid_staffs = []
    staff_list.each do |staffsub|
      unless staffsub.valid?
        @invalid_staffs<<staffsub
      end
	  end
    return @invalid_staffs
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
