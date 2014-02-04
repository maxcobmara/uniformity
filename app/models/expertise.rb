class Expertise < ActiveRecord::Base
  has_many :staffs, dependent: :nullify
  
  BRANCH = [
             #  Displayed       stored in db
             ["Cawangan Pelaut", 1],
             ["Cawangan Bekalan dan Urusetia", 2],
             ["Cawangan Teknikal", 3]
  ]

  def expertise_details
    "#{short_name}"+" - "+"#{name}"
  end
end
