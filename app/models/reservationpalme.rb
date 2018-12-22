class Reservationpalme < ApplicationRecord
  belongs_to :palme
  validate :limit_personne

  def self.list_creneau
     ["selectionnez un créneau", "Mercredi: 19h - 20h"]
  end

  def self.creneau_limit
    {
     "Mercredi: 19h - 20h" => 1,
    }
  end

  def limit_personne
    if Reservationpalme.creneau_limit[creneau] ==  Reservationpalme.where(creneau: creneau).count
      errors.add(:creneau, "complet, choisissez un autre créneau")
    end
  end

end
