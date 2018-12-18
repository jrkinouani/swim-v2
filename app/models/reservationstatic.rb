class Reservationstatic < ApplicationRecord
  belongs_to :staticswim
  validate :limit_personne

  def self.list_creneau
    ["selectionnez un créneau", "Mardi: 13h - 13h45", "Mardi: 19h05 - 20h", "Jeudi: 19h05 - 20h","Vendredi: 13h - 13h45"]
  end
  def self.creneau_limit
    {
    "Mardi: 13h - 13h45" => 1,
     "Mardi: 19h05 - 20h" => 6,
    "Jeudi: 19h05 - 20h"  => 6,
    "Vendredi: 13h - 13h45" => 6
    }
  end

  def limit_personne
    if Reservationstatic.creneau_limit[creneau] ==  Reservationstatic.where(creneau: creneau).count
      errors.add(:creneau, "complet, choisissez un autre créneau")
    end
  end
end
