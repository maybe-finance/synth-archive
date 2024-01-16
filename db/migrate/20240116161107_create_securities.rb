class CreateSecurities < ActiveRecord::Migration[7.2]
  def change
    create_table :securities, id: :uuid do |t|
      t.references :exchange, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.string :symbol
      t.string :legal_name
      t.jsonb :links, default: {}
      t.string :color
      t.text :description

      t.timestamps
    end
  end
end
