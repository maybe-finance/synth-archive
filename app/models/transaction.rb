class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :transactable, polymorphic: true, optional: true

  after_create :update_user_balance

  def update_user_balance
    user.balance += self.amount
    user.save
  end
end
