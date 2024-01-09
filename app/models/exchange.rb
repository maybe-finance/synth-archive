class Exchange < ApplicationRecord
  has_many :operating_hours
  has_many :holidays
  has_many :transactions, as: :transactable, dependent: :destroy
  belongs_to :parent, class_name: "Exchange", foreign_key: "operating_mic_code", primary_key: "mic_code", optional: true
  has_many :children, class_name: "Exchange", foreign_key: "operating_mic_code", primary_key: "mic_code"
end
