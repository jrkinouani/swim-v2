class Nagesynchro < ApplicationRecord
  has_many :reservationsynchros, dependent: :destroy
end
