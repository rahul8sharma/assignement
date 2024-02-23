module Transactions
  class Import
    attr_reader :data
  
    def initialize(file_path)
      @data = JSON.load(File.read(file_path))
    end

    def call
      filter_duplicate_transactions
      sort_transactions
      import_transactions
    end

    def filter_duplicate_transactions
      @data.uniq! { |transaction| transaction['activity_id'] }
    end

    def sort_transactions
      @data.sort_by! { |transaction| DateTime.parse(transaction['date']) }
    end

    def import_transactions
      @data.each do |transaction|
        Transaction.create(
          activity_id: transaction['activity_id'],
          amount: transaction['amount'],
          balance: transaction['balance'],
          description: formatted_description(transaction),
          transaction_type: transaction['type'].downcase,
          transaction_date: transaction['date']
        )
      end
    end

    def formatted_description(transaction)
      "#{transaction.dig('destination').dig('description')} #{transaction.dig('source').dig('description')}"
    end
  end
end