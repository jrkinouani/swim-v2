class Reservationad < ApplicationRecord
  belongs_to :adulte
  validate :limit_personne

  def self.list_creneau
    ["selectionnez un créneau", "Lundi: 19h05 - 20h", "Vendredi: 19h05 - 20h"]
  end

  def self.creneau_limit
    {
    "Lundi: 19h05 - 20h" =>  8,
    "Vendredi: 19h05 - 20h" => 8
    }
  end

  def limit_personne
    if Reservationad.creneau_limit[creneau] ==  Reservationad.where(creneau: creneau).count
      errors.add(:creneau, "complet, choisissez un autre créneau")
    end
  end
end
