class Jardin < ApplicationRecord
  has_many :reservationjards, dependent: :destroy
end
