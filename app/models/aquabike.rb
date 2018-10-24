class Aquabike < ActiveRecord::Base
  has_many :reservation_aquabike, dependent: :destroy
end
