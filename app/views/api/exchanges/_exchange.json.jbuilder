json.id exchange.id
json.name exchange.name
json.acronym exchange.acronym
json.mic_code exchange.mic_code
json.city exchange.city
json.country_code exchange.country_code
json.kind exchange.kind
json.timezone exchange.timezone
json.currency exchange.currency
json.links exchange.links

if params[:related]
  if exchange.kind == "segment"
    json.operating_exchange do
      json.id exchange.parent.id
      json.name exchange.parent.name
      json.acronym exchange.parent.acronym
      json.mic_code exchange.parent.mic_code
      json.city exchange.parent.city
      json.country_code exchange.parent.country_code
      json.kind exchange.parent.kind
      json.timezone exchange.parent.timezone
      json.currency exchange.parent.currency
      json.links exchange.parent.links
    end
  end

  if exchange.kind == "operating"
    json.segment_exchanges do
      json.array! exchange.children do |segment|
        json.id segment.id
        json.name segment.name
        json.acronym segment.acronym
        json.mic_code segment.mic_code
        json.city segment.city
        json.country_code segment.country_code
        json.kind segment.kind
        json.timezone segment.timezone
        json.currency segment.currency
        json.links segment.links
      end
    end
  end
end
