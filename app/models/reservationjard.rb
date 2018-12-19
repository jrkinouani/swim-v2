class Reservationjard < ApplicationRecord
  belongs_to :jardin
  validate :limit_personne

  def self.list_creneau

    ["selectionnez un créneau",
    "Mrecredi: 10h - 10h45 (2 - 3ans)",
    "Mrecredi: 10h50 - 11h35 (4 - 5ans)",
    "Samedi: 10h - 10h45 (2 - 3ans)",
    "Samedi: 10h50 - 11h35 (4 - 5ans)",
    "Mrecredi: 14h30 - 15h15 (2- 3ans)"
    ]
  end

  def self.creneau_limit
    {
      "Mrecredi: 10h - 10h45 (2 - 3ans)" => 12,
      "Mrecredi: 10h50 - 11h35 (4 - 5ans)" => 12,
      "Samedi: 10h - 10h45 (2 - 3ans)" => 12,
      "Samedi: 10h50 - 11h35 (4 - 5ans)" => 12,
      "Mrecredi: 14h30 - 15h15 (2- 3ans)" => 12,
    }
  end

  def limit_personne
    if Reservationjard.creneau_limit[creneau] ==  Reservationjard.where(creneau: creneau).count
      errors.add(:creneau, "complet, choisissez un autre créneau")
    end
  end
end
