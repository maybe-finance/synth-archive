# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Parse CSV data from lib/data/exchanges.csv
# require 'csv'

# csv_text = File.read(Rails.root.join('lib/data/exchanges.csv'))

# csv = CSV.parse(csv_text, headers: true, encoding: 'utf-8')

# # Headers: name,code,country,timezone,currency,open_time,close_time,pre_trading_start,pre_trading_end,post_trading_start,post_trading_end,intermission_start,intermission_end
# csv.each do |row|
#   exchange = Exchange.find_or_create_by!(
#     name: row['name'],
#     mic_code: row['code'],
#     country: row['country'],
#     timezone: row['timezone'],
#     currency: row['currency']
#   )

#   # Remove all associated operating_hours
#   exchange.operating_hours.destroy_all

#   # Create new operating hours and loop through `day_of_week` (1-5)
#   (1..5).each do |day_of_week|
#     exchange.operating_hours.create!(
#       day_of_week: day_of_week,
#       open_time: row['open_time'],
#       close_time: row['close_time'],
#       pre_trade_start_time: row['pre_trading_start'],
#       pre_trade_end_time: row['pre_trading_end'],
#       post_trade_start_time: row['post_trading_start'],
#       post_trade_end_time: row['post_trading_end'],
#       intermision_start_time: row['intermission_start'],
#       intermision_end_time: row['intermission_end']
#     )
#   end
# end




#require 'json'

# exchange_data = JSON.parse(File.read(Rails.root.join('lib/data/exchanges.json')))['data']

# exchange_data.each do |exchange|
#   Exchange.find_or_create_by!(
#     name: exchange['name'],
#     mic_code: exchange['code'],
#     country: exchange['country'],
#     timezone: exchange['timezone']
#   )
# end

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
