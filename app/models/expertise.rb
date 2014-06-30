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
  
  def self.get_expertise(fr_excel,arr_fr_excel)
    expertises=where('short_name ILIKE (?)',fr_excel.squeeze(" ").strip)
    if expertises.count > 0
      return expertises[0].id
    else
      #return 19 #id for panglima tentera laut
      unless arr_fr_excel.include?(fr_excel)
        expertise = find_by_short_name(fr_excel) || new 
        expertise.short_name = fr_excel 
        expertise.save!
        return expertise.id
      end
      

    end
  end
  
end
