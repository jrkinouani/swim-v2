class Reservationgym < ApplicationRecord
  validate :limit_personne
  belongs_to :aquagym
  before_create :set_nb_resa


  def self.list_creneau
    ["selectionnez un créneau", "Mardi 19h05 - 20h", "Jeudi 19h05 - 20h", "Samedi 13h - 13h45"]
  end

  def self.creneau_limit
    {
      "Mardi 19h05 - 20h" => 12,
      "Jeudi 19h05 - 20h" => 12,
      "Samedi 13h - 13h45" => 12
    }
  end

  def limit_personne
    if Reservationgym.creneau_limit[creneau] ==  Reservationgym.where(creneau: creneau).count
      errors.add(:creneau, "Ce créneau est complet")
    end
  end

  def self.list_events
    {
       0 => [], #dimanche
       1 => [], #lundi
       2 => ["19h05 - 20h"], #mardi
       3 => [], #mercredi
       4 => ["19h05 - 20h"], #jeudi
       5 => [], #vendredi
       6 => ["13h - 13h45"], #samedi
    }
  end

  private

  def set_nb_resa
   self.nb_resa = self.aquagym.nbseance
  end
end
