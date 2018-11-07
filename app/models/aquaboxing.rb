class Aquaboxing < ApplicationRecord
  has_many :reservationboxings, dependent: :destroy
end
