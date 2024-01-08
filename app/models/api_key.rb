class ApiKey < ApplicationRecord
  belongs_to :user

  before_create :generate_key

  private

  def generate_key
    self.key = SecureRandom.hex(20)
  end
end
