class CreateHolidays < ActiveRecord::Migration[7.2]
  def change
    create_table :holidays, id: :uuid do |t|
      t.references :exchange, null: false, foreign_key: true, type: :uuid
      t.string :description
      t.date :date

      t.timestamps
    end
  end
end
