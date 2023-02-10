json.extract! bet, :id, :user_id, :status, :odds, :book, :tailed, :created_at, :updated_at
json.url bet_url(bet, format: :json)
