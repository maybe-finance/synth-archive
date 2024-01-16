class CreateChangesets < ActiveRecord::Migration[7.2]
  def change
    create_table :changesets do |t|
      t.jsonb :proposed_changes
      t.string :status, default: 'pending'
      t.references :changeable, polymorphic: true, type: :uuid
      t.references :user, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
