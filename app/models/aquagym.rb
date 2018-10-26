class Aquagym < ApplicationRecord
  has_many :reservationgyms, dependent: :destroy
end
