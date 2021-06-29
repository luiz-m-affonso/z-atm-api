class AddFinancialTransactionsToBankAccounts < ActiveRecord::Migration[6.1]
  def change
    add_reference :financial_transactions, :bank_account, type: :uuid, foreign_key: true
  end
end
