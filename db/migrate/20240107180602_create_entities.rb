class CreateEntities < ActiveRecord::Migration[7.2]
  def change
    create_table :entities, id: :uuid do |t|
      t.string :name
      t.string :symbol
      t.string :domain
      t.string :color
      t.string :kind

      t.timestamps
    end
  end
end
