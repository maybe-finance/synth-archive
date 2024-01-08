# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'json'

exchange_data = JSON.parse(File.read(Rails.root.join('lib/data/exchanges.json')))['data']

exchange_data.each do |exchange|
  Exchange.find_or_create_by!(
    name: exchange['name'],
    mic_code: exchange['code'],
    country: exchange['country'],
    timezone: exchange['timezone']
  )
end

# stock_data = JSON.parse(File.read(Rails.root.join('lib/data/stocks.json')))['data']

# stock_data.each do |stock|
#   Entity.find_or_create_by!(
#     name: stock['name'], 
#     symbol: stock['symbol'], 
#     kind: 'stock'
#   ).tap do |entity|
#     entity.details = stock
#     entity.save!
#   end
# end

# etf_data = JSON.parse(File.read(Rails.root.join('lib/data/etfs.json')))['data']

# etf_data.each do |etf|
#   Entity.find_or_create_by!(
#     name: etf['name'], 
#     symbol: etf['symbol'], 
#     kind: 'etf'
#   ).tap do |entity|
#     entity.details = etf
#     entity.save!
#   end
# end
