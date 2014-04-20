class Contract < ActiveRecord::Base
  before_save :set_category
  has_many :uniform_stock_receiveds
  belongs_to :contractor, class_name: "Company", foreign_key: "company_id"
  belongs_to :issuer,     class_name: "Staff",          foreign_key: "issued_by"
  belongs_to :type,       class_name: "ContractType",   foreign_key: "contract_type"
  validates_presence_of :value

  scope :uniform_contract, -> { where(category: 2) }

  def set_category
    if category.nil?
      self.category = 2
    end
  end
  
end
