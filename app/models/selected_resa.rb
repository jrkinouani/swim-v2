class SelectedResa < ApplicationRecord
    scope :oncoming, -> { where("date >= ?", Time.now.yesterday ) }
end
