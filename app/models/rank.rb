class Rank < ActiveRecord::Base
  has_many :staffs, dependent: :nullify
  
  RATE = [
             #  Displayed       stored in db
             ["Junior Rate", 1],
             ["Senior Rate", 2],
             ["Kadet Kanan & Ke Bawah", 3],
             ["Leftenan Muda & Ke Atas", 4]
           ]
           
  CATEGORY = [
            #  Displayed       stored in db
              ["Lain-Lain Pangkat", 1],
              ["Pegawai", 2]
  ]
  
  def rank_details
    "#{shortname}"+" - "+"#{name}"
  end

end
