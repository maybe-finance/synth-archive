class PendingUpload < ApplicationRecord
  has_one_attached :file
  belongs_to :user
  belongs_to :approvable, polymorphic: true
end
