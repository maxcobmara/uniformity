class Position < ActiveRecord::Base
  has_many :staffs, dependent: :nullify
  
  def self.get_position(fr_excel,arr_fr_excel)
    positions=where('name ILIKE (?)',fr_excel.squeeze(" ").strip)
    if positions.count > 0
      return positions[0].id
    else
      #return 19 #id for panglima tentera laut
      unless arr_fr_excel.include?(fr_excel)
        position = find_by_name(fr_excel) || new 
        position.name = fr_excel 
        position.save!
        return position.id
      end
      

    end
  end
end
