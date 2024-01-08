class Exchange < ApplicationRecord
  has_many :operating_hours
  has_many :holidays
  has_many :transactions, as: :transactable, dependent: :destroy
end
