class CreateApiKeys < ActiveRecord::Migration[7.2]
  def change
    create_table :api_keys, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :key

      t.timestamps

      t.index :key, unique: true
    end
  end
end
