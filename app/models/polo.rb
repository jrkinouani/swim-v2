class Polo < ApplicationRecord
  has_many :reservationpolos, dependent: :destroy
end
