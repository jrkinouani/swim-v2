class Reservationgym < ApplicationRecord
  validate :limit_personne
  belongs_to :aquagym


  def self.list_creneau
    ["selectionnez un créneau", "Mardi 19h05 - 20h", "Jeudi 19h05 - 20h", "Samedi 13h - 13h45"]
  end

  def self.creneau_limit
    {
      "Mardi 19h05 - 20h" => 1,
      "Jeudi 19h05 - 20h" => 1,
      "Samedi 13h - 13h45" => 1
    }
  end

  def limit_personne
    if Reservationgym.creneau_limit[creneau] ==  Reservationgym.where(creneau: creneau).count
      errors.add(:creneau, "Ce créneau est complet")
    end
  end
end
