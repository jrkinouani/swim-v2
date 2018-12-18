class Reservation < ApplicationRecord
  belongs_to :aquabike
  validate :limit_personne

  def self.list_creneau
    ["selectionnez un créneau",
       "Lundi: 12h15 - 13h",
       "Lundi: 17h30 - 18h15",
      "Mardi: 12h15 - 13h",
      "Mardi: 18h15 - 19h00",
      "Mercredi: 12h15 - 13h",
      "Mrecredi: 17h30 - 18h15",
      "Mercredi:18H15 - 19h",
      "Jeudi: 12h15 - 13h",
      "Jeudi: 17h30 - 18h15",
      "Jeudi: 1!h15 - 19h00",
       "Vendredi: 12h15 - 13h",
      "Samedi: 12h15 - 13h"]
  end

  def self.creneau_limit
    {
      "Lundi: 12h15 - 13h" => 6,
      "Lundi: 17h30 - 18h15"=> 6,
     "Mardi: 12h15 - 13h" => 6,
     "Mardi: 18h15 - 19h00" => 6,
     "Mercredi: 12h15 - 13h" => 6,
     "Mrecredi: 17h30 - 18h15" => 6,
     "Mercredi:18H15 - 19h" => 6,
     "Jeudi: 12h15 - 13h" => 6,
     "Jeudi: 17h30 - 18h15" => 6,
     "Jeudi: 1!h15 - 19h00" => 6,
      "Vendredi: 12h15 - 13h" => 6,
     "Samedi: 12h15 - 13h" => 6,
    }
  end

  def limit_personne
    if Reservation.creneau_limit[creneau] ==  Reservation.where(creneau: creneau).count
      errors.add(:creneau, "complet, choisissez un autre créneau")
    end
  end
end
