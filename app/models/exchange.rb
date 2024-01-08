class Exchange < ApplicationRecord
  has_many :operating_hours
  has_many :holidays
end
