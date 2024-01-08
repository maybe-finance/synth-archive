class CreateOperatingHours < ActiveRecord::Migration[7.2]
  def change
    create_table :operating_hours, id: :uuid do |t|
      t.references :exchange, null: false, foreign_key: true, type: :uuid
      t.integer :day_of_week # 0 = Sunday, 1 = Monday, etc.
      t.time :open_time
      t.time :close_time
      t.time :intermision_start_time
      t.time :intermision_end_time
      t.time :pre_trade_start_time
      t.time :pre_trade_end_time
      t.time :post_trade_start_time
      t.time :post_trade_end_time
      t.date :specific_date

      t.timestamps
    end
  end
end
