class CreatePendingUploads < ActiveRecord::Migration[7.2]
  def change
    create_table :pending_uploads, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :approvable, polymorphic: true, type: :uuid
      t.timestamps
    end
  end
end
