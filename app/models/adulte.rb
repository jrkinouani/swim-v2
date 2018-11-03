class Adulte < ApplicationRecord
  has_many :reservationads, dependent: :destroy

end
