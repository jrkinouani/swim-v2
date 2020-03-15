class Reservationpalme < ApplicationRecord
  belongs_to :palme
  validate :limit_personne
  before_create :set_nb_resa

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
   self.nb_resa = self.palme.nbseance
  end
end
