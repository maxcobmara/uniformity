class KitUniform < ActiveRecord::Base
  belongs_to :uniform_item,  :foreign_key => 'uniform_id'
  belongs_to :kit

  def self.group(kit)
    a = kit.root.code
    if (a == "L-1") || (a == "L-2")||(a == "L-5")||(a == "L-6")   #quantity, senior_rate (LLP, PSSTLDM & Pasukan Simpanan W Kerahan)
      b = 1
    elsif (a=="L-3")||(a=="L-4")||(a=="L7")                       #pk, pkk, graduan (Pegawai Kadet Kanan & Ke Bawah)
      b = 2
    elsif (a=="W-9")                                              #peg_l, peg_p (Pegawai Leftenan Muda & Ke Atas)
      b=3
    elsif (a=="W-2")                                              #peg, quantity, srate (LLP & Semua Pegawai)
      b=4
    elsif (a=="L-11")                                             #pkbm - peg_l, peg_p, kadet_l, kadet_p (Peg & Kadet PKBM)
      b=5
    else                                                          #quantity2 (Selain yang di atas - HAK - 1 jenis kuantiti shj)
      b=6
    end
    return b
  end

end
