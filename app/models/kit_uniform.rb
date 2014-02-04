class KitUniform < ActiveRecord::Base
  belongs_to :uniform_item,  :foreign_key => 'uniform_id'
  belongs_to :kit

  #from views/kits/_kit_uniform_fields.html.haml - assign @group - view below HAK fields accordingly.
  def self.group(kit)
    a = kit.root.code
    if (a == "L-1") || (a == "L-01")||(a == "L-02")|| (a == "L-2")||(a=="L-05")||(a == "L-5")||(a=="L-06")||(a == "L-6")   #quantity, senior_rate (LLP, PSSTLDM & Pasukan Simpanan W Kerahan)
      b = 1
    elsif (a=="L-3")||(a=="L-4")||(a=="L7")||(a=="L-03")||(a=="L-04")||(a=="L-07")  #pk, pkk, graduan (Pegawai Kadet Kanan & Ke Bawah)
      b = 2
    elsif (a=="W-9")||(a=="W-09")                                 #peg_l, peg_p (Pegawai Leftenan Muda & Ke Atas)
      b=3
    elsif (a=="W-2")||(a=="W-02")                                 #peg, quantity, srate (LLP & Semua Pegawai)
      b=4
    elsif (a=="L-11")                                             #pkbm - peg_l, peg_p, kadet_l, kadet_p (Peg & Kadet PKBM)
      b=5
    else                                                          #quantity2 (Selain yang di atas - HAK - 1 jenis kuantiti shj)
      b=6
    end
    return b
  end
  
  #from STAFF model - method : assign_default_provision (when EDIT & UPDATE staff info)
  def self.group_by_rank(rate,gender,rank_name,religion)  
    kit_ids=[]
    if (rate == 1) || (rate == 2)   #for TLDM staff only (LLP), excluding PSSTLDM & Pasukan Simpanan W Kerahan, JUNIOR RATE & SENIOR RATE
      if gender == 1  
        kit_ids = Kit.where('combo_code=? OR combo_code=?','L-1-01','L-01-01').pluck(:id) #for LLP - L-1 & L-2 skala remain unchange throughout the service
        if religion == 1
          kit_ids.concat(Kit.where('combo_code=? OR combo_code=?','L-1-04','L-01-04').pluck(:id)) #extra for male - religion - Islam
        elsif religion == 2 
          kit_ids.concat(Kit.where('combo_code=? OR combo_code=?','L-1-05','L-01-05').pluck(:id)) #extra for male - religion - Sikh
        end
      elsif gender == 2                                                #except for junior/senior rate-refer staff SHOW page & below method
        kit_ids = Kit.where('combo_code=? OR combo_code=?','L-2-01','L-02-01').pluck(:id)  
      end
      #ABOVE - both Junior & senior rate share the same skala, except for show - retrieve fields value accordingly - quantity & srate. 
      #BELOW - additional for SENIOR (rank_rate ie. rate == 2)
      if rate == 2 
        if rank_name == 'BM' || rank_name == 'BK' #Bintara Kanan & Bintara Muda
          if gender == 1
            kit_ids.concat(Kit.where('combo_code=? OR combo_code=?','L-1-03','L-01-03').pluck(:id))
          elsif gender == 2
            kit_ids.concat(Kit.where('combo_code=? OR combo_code=?','L-2-03','L-02-03').pluck(:id)) 
          end
        elsif rank_name == 'PW 1' || rank_name == 'PW 2'
          if gender == 1
            kit_ids.concat(Kit.where('combo_code=? OR combo_code=?','L-1-02','L-01-02').pluck(:id)) 
          elsif gender == 2
            kit_ids.concat(Kit.where('combo_code=? OR combo_code=?','L-2-02','L-02-02').pluck(:id)) 
          end
        end
      end
      #BELOW - cawangan / kepakaran for all LLP - male or female, senior or junior - canot Do - shortname not matching-ENGLISH vs BM
    
    #BELOW - For TLDM Pegawai (Pegawai Kadet Kanan downwards only - PK, PKK, Graduan)    
    elsif rate == 3
      if gender == 1  #for male only
         kit_ids = Kit.where('combo_code=? OR combo_code=?','L-3-01','L-03-01').pluck(:id) 
         if religion == 1 #for muslim only
           kit_ids.concat(Kit.where('combo_code=? OR combo_code=?','L-3-02','L-03-02').pluck(:id))
         elsif religion == 2 #for sikh only
           kit_ids.concat(Kit.where('combo_code=? OR combo_code=?','L-3-03','L-03-03').pluck(:id))
         end  
      elsif gender == 2 #for female
       kit_ids = Kit.where('combo_code=? OR combo_code=?','L-4-01','L-04-01').pluck(:id)  
      end
    #BELOW - For TLDM Pegawai (Pegawai - Leftenan Muda onwards)  
    end
    if rate == 4
      #kit_ids = [113]
      kit_ids = Kit.where('combo_code=? OR combo_code=?','W-9-01','W-09-01').pluck(:id)
      if (rank_name == 'LAKSMA') || (rank_name == 'LAKSDA') || (rank_name == 'LAKSDYA') || (rank_name == 'LKSMN') || (rank_name == 'LKADA')
        kit_ids.concat(Kit.where('combo_code=? OR combo_code=?','W-9-02','W-09-02').pluck(:id))
      end
    end
    return kit_ids 
  end
  
  #from STAFF (show page) - to determine which HAK columns to be read : quantity,senior_rate,pk,pkk,graduan,peg_l,peg_p,quantity2
  def kit_qty(gender,rank_rate,rank_name)  
    if rank_rate == 1     # LLP - junior rate (for both gender - skala already selected in 'group_by_rank' method)
      qty = quantity
    elsif rank_rate == 2  # LLP - senior rate (for both gender - skala already selected in 'group_by_rank' method)
      qty = senior_rate  
    elsif rank_rate == 3  # Pegawai - Peg Kadet Kanan & downwards (pk, pkk, graduan - graduan not yet defined)
      if rank_name == 'KDT KN'
        qty = pkk
      elsif rank_name == 'KDT'
        qty = pk
      else
        qty = graduan     #this part still pending COZ NO RANK OF "graduan" exist (pegawai kadet & pegawai kadet kanan)
      end
    elsif rank_rate == 4  # W9 - Pegawai Leftenan Muda onwards (peg_l vs peg_p) - used in STAFF show page.
      if gender==1
        qty=peg_l
      elsif gender==2
        qty = peg_p 
      end
    end
    return qty
  end

end
