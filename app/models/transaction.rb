class Transaction < ApplicationRecord
  enum transaction_type: [:deposit, :investment, :refund, :withdrawal, :transfer]
end
