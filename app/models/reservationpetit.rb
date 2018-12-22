class Reservationpetit < ApplicationRecord
  belongs_to :nagepetit
  validate :limit_personne

  def self.list_creneau
    ["selectionnez un créneau",
    "Mercredi: 9h - 9h45 (3-24mois)",
     "Samedi: 9h - 9h45 (3-24mois)",
    "Samedi 15h30 - 16h15"]
  end

  def self.creneau_limit
    {
      "Mercredi: 9h - 9h45 (3-24mois)" =>1,
       "Samedi: 9h - 9h45 (3-24mois)" =>12,
      "Samedi 15h30 - 16h15" =>12
    }
  end

  def limit_personne
    if Reservationpetit.creneau_limit[creneau] ==  Reservationpetit.where(creneau: creneau).count
      errors.add(:creneau, "complet, choisissez un autre créneau")
    end
  end
end
