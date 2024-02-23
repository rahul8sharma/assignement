class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :activity_id
      t.float :amount, default: 0
      t.float :balance, default: 0
      t.string :description
      t.integer :transaction_type
      t.datetime :transaction_date

      t.timestamps
    end
  end
end
