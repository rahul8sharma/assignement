json.extract! transaction, :amount, :balance, :description, :transaction_type, :transaction_date
json.url transaction_url(transaction, format: :json)
