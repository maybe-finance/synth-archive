class AddMiscDataToEntities < ActiveRecord::Migration[7.2]
  def change
    add_column :entities, :details, :jsonb
    add_index :entities, :details, using: :gin
  end
end
