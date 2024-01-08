class CreateExchanges < ActiveRecord::Migration[7.2]
  def change
    create_table :exchanges, id: :uuid do |t|
      t.string :name
      t.string :mic_code
      t.string :country
      t.string :timezone
      t.string :color
      t.text :description
      t.jsonb :links

      t.timestamps
    end
  end
end
