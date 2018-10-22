class Aquabike < ApplicationRecord
  has_many :reservations, dependent: :destroy
end
