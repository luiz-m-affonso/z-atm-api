class CreateFinancialTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :financial_transactions, id: :uuid do |t|
      t.decimal :amount
      t.string :type

      t.timestamps
    end
  end
end
