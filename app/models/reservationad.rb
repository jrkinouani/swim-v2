class Reservationad < ApplicationRecord
  belongs_to :adulte
  validate :limit_personne
  before_create :set_nb_resa

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

  def self.list_events
    {
       0 => [], #dimanche
       1 => ["19h05 - 20h"], #lundi
       2 => [], #mardi
       3 => [], #mercredi
       4 => [], #jeudi
       5 => ["19h05 - 20h"], #vendredi
       6 => [], #samedi
    }
  end

  private

  def set_nb_resa
   self.nb_resa = self.adulte.nbseance
  end
end
