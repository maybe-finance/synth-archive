json.data do
  json.partial! 'exchange', locals: {exchange: @exchange}
end
json.meta do
  json.credits_used 1
  json.credits_remaining @api_key.user.balance
end