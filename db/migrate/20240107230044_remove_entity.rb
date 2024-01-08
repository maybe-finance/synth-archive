class RemoveEntity < ActiveRecord::Migration[7.2]
  def change
    drop_table :entities, id: :uuid do |t|
      t.string :name
      t.string :symbol
      t.string :domain
      t.string :color
      t.string :kind
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.jsonb :details

      t.index :details, name: "index_entities_on_details", using: :gin
    end
  end
end
