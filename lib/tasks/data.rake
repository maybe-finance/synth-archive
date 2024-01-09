namespace :data do
  desc "Import exchanges"
  task import_exchanges: :environment do
    # https://www.iso20022.org/market-identifier-codes
    require 'csv'

    csv = CSV.parse(File.read(Rails.root.join('lib/data/exchanges.csv')), headers: true)

    # These are the CSV columns:
    # "MIC","OPERATING MIC","OPRT/SGMT","MARKET NAME-INSTITUTION DESCRIPTION","LEGAL ENTITY NAME","LEI","MARKET CATEGORY CODE","ACRONYM","ISO COUNTRY CODE (ISO 3166)","CITY","WEBSITE","STATUS","CREATION DATE","LAST UPDATE DATE","LAST VALIDATION DATE","EXPIRY DATE","COMMENTS"

    # This is the schema I'm trying to backfill:
    # create_table "exchanges", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    #   t.string "name"
    #   t.string "mic_code"
    #   t.string "country"
    #   t.string "timezone"
    #   t.string "currency"
    #   t.string "color"
    #   t.text "description"
    #   t.jsonb "links"
    #   t.datetime "created_at", null: false
    #   t.datetime "updated_at", null: false
    #   t.string "operating_mic_code"
    #   t.string "kind", default: "operating"
    #   t.string "legal_name"
    #   t.string "lei"
    #   t.string "mic_category"
    #   t.string "acronym"
    #   t.string "country_code"
    #   t.string "city"
    #   t.boolean "active", default: true
    #   t.text "notes"
    #   t.boolean "primary", default: false
    # end

    csv.each do |row|
      links = nil
      
      website = row['WEBSITE']&.downcase
      
      if website.present?
        website = website.start_with?('http://') ? website.gsub('http://', 'https://') : website
        website = website.start_with?('https://') ? website : 'https://' + website

        links = { website: website }
      end

      Exchange.find_or_create_by(mic_code: row['MIC']).update(
        name: row['MARKET NAME-INSTITUTION DESCRIPTION']&.titleize,
        operating_mic_code: row['OPERATING MIC'],
        kind: row['OPRT/SGMT'] == 'OPRT' ? 'operating' : 'segment',
        legal_name: row['LEGAL ENTITY NAME']&.titleize,
        lei: row['LEI'],
        mic_category: row['MARKET CATEGORY CODE'],
        acronym: row['ACRONYM'],
        country_code: row['ISO COUNTRY CODE (ISO 3166)'],
        city: row['CITY']&.titleize,
        active: row['STATUS'] == 'ACTIVE',
        notes: row['COMMENTS']&.downcase&.capitalize,
        links: links
      )

      puts "Imported #{row['MARKET NAME-INSTITUTION DESCRIPTION'].titleize}"
    end

  end

  desc "Geocode exchanges"
  task geocode_exchanges: :environment do
    Exchange.where(lat: nil, lng: nil).each do |exchange|
      geocode = Geocoder.search("#{exchange.city}, #{exchange.country_code}").first

      if geocode.nil?
        puts "Geocode not found for #{exchange.name}"
      else
        exchange.lat = geocode.latitude
        exchange.lng = geocode.longitude
        exchange.save

        puts "Geocoded #{exchange.name}"
      end
    end
  end

  desc "Set timezone for exchanges"
  task set_timezone_for_exchanges: :environment do
    Exchange.where(timezone: nil).each do |exchange|
      puts "Exchange: #{exchange.id} — Lat: #{exchange.lat} — Lng: #{exchange.lng}"

      if exchange.present? && exchange.lat.present? && exchange.lng.present?
        timezone = Timezone.lookup(exchange.lat, exchange.lng)

        if timezone.nil?
          puts "Timezone not found for #{exchange.name}"
        else
          exchange.timezone = timezone.name
          exchange.save

          puts "Set timezone for #{exchange.name}"
        end
      end
    end
  end

  desc "Set currency for exchanges"
  task set_currency_for_exchanges: :environment do
    Exchange.where(currency: nil).each do |exchange|
      data = GeoNames::CountryInfo.search(city: exchange.city, country: exchange.country_code).first

      puts "Exchange: #{exchange.id} — #{exchange.name}"

      if data.nil? || exchange.country_code == "ZZ"
        puts "Currency not found for #{exchange.name}"
      else
        exchange.currency = data.last.first['currencyCode']
        exchange.save

        puts "Set currency for #{exchange.name}"
      end
    end
  end
end

