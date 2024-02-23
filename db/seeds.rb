# Import the transactions data from json file.
file_path = "#{Rails.root}/public/data/complicated_ledger.json"
Transactions::Import.new(file_path).call