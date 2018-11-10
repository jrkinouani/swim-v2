class Ecole < ApplicationRecord
  has_many :reservationecoles, dependent: :destroy
end
