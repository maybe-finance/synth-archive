json.extract! security, :id, :logos, :exchange_id, :name, :symbol, :legal_name, :links, :color, :description, :created_at, :updated_at
json.url security_url(security, format: :json)
json.logos url_for(security.logos)
