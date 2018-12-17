class Reservationecole < ApplicationRecord
  belongs_to :ecole
  validate :limit_personne

  def self.list_creneau
     ["selectionnez un créneau",
      "Lundi: 16h35 - 17h20 (6-8 ans)" ,
      "Mardi 16h35 - 17h20 (Grd débutant 5-7 ans)",
      "Mardi 17h25 - 18h10 (9-12 ans)",
      "Mercredi 14H - 14h45 (6 -8 ans)",
      "Mercredi 14h45 -15h30 (9-12 ans)",
      "Vendredi 16h35 - 17h 20 (6-8ans)",
      "Vendredi 17h25 -18h10 (9-12 ans)",
      "Vendredi 18h15 -19h (Ados 12-17 ans)"]
  end

  def self.creneau_limit
    {
      "Lundi: 16h35 - 17h20 (6-8 ans)" =>  1,
      "Mardi 16h35 - 17h20 (Grd débutant 5-7 ans)" => 1,
      "Mardi 17h25 - 18h10 (9-12 ans)" =>  1,
      "Mercredi 14H - 14h45 (6 -8 ans)" =>  1,
      "Mercredi 14h45 -15h30 (9-12 ans)"=>  1,
      "Vendredi 16h35 - 17h 20 (6-8ans)" =>  1,
      "Vendredi 17h25 -18h10 (9-12 ans)" =>  1,
      "Vendredi 18h15 -19h (Ados 12-17 ans)" =>  1,
    }
   end

   def limit_personne
     if Reservationecole.creneau_limit[creneau] ==  Reservationecole.where(creneau: creneau).count
       errors.add(:creneau, "complet, choisissez un autre créneau")
     end
   end
end
