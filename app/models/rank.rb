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

  def self.get_rank(fr_excel)
    ranks=where('name ILIKE (?) OR shortname ILIKE (?)',fr_excel, fr_excel)
    if ranks.count > 0
      return ranks[0].id
    else
      return 21 #id for rank
    end    
  end

end
