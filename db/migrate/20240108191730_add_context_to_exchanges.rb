class AddContextToExchanges < ActiveRecord::Migration[7.2]
  def change
    add_column :exchanges, :operating_mic_code, :string
    add_column :exchanges, :kind, :string, default: "operating" # "operating" or "segment"
    add_column :exchanges, :legal_name, :string
    add_column :exchanges, :lei, :string
    add_column :exchanges, :mic_category, :string
    add_column :exchanges, :acronym, :string
    add_column :exchanges, :country_code, :string # ISO 3166-1 alpha-2
    add_column :exchanges, :city, :string
    add_column :exchanges, :active, :boolean, default: true
    add_column :exchanges, :notes, :text
    add_column :exchanges, :primary, :boolean, default: false
  end
end
