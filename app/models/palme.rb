class Palme < ApplicationRecord
  has_many :reservationpalmes, dependent: :destroy
end
