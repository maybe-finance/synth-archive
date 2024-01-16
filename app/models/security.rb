class Security < ApplicationRecord
  belongs_to :exchange

  has_many_attached :logos
end
