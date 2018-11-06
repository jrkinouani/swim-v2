class Aquaparcour < ApplicationRecord
  has_many :reservationcours, dependent: :destroy

end
