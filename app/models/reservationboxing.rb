class Reservationboxing < ApplicationRecord
  belongs_to :aquaboxing
  validate :limit_personne

  def self.list_creneau
    ["selectionnez un créneau", "Lundi: 18h15 - 19h"]
  end

  def self.creneau_limit
    { "Lundi: 18h15 - 19h" => 1}
  end

  def limit_personne
    if Reservationboxing.creneau_limit[creneau] ==  Reservationboxing.where(creneau: creneau).count
      errors.add(:creneau, "complet, choisissez un autre créneau")
    end
  end
end
