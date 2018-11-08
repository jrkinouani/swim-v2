class Nagepetit < ApplicationRecord
    has_many :reservationpetits, dependent: :destroy
end
