class Jardin < ApplicationRecord
  has_many :reservationjardins, dependent: :destroy
end
