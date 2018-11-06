class Staticswim < ApplicationRecord
  has_many :reservationstatics, dependent: :destroy
end
