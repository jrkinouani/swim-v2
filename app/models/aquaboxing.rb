class Aquaboxing < ApplicationRecord
  has_many :reservationboxes, dependent: :destroy
end
