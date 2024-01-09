class AddLatLngToExchanges < ActiveRecord::Migration[7.2]
  def change
    add_column :exchanges, :lat, :decimal, precision: 10, scale: 6
    add_column :exchanges, :lng, :decimal, precision: 10, scale: 6
  end
end
