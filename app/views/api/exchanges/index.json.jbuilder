json.data do
  json.partial! "exchange", collection: @exchanges, as: :exchange
end
json.paging do
  json.prev @pagy_metadata[:prev_url]
  json.next @pagy_metadata[:next_url]
  json.total_records @pagy_metadata[:count]
  json.current_page @pagy_metadata[:page]
  json.per_page @pagy_metadata[:items]
  json.total_pages @pagy_metadata[:pages]
end
json.meta do
  json.credits_used 1
  json.credits_remaining @api_key.user.balance
end
