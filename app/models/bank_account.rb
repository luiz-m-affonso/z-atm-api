class BankAccount < ApplicationRecord
  belongs_to :bank_customer
  has_many :financial_transactions, dependent: :destroy
  validates :account_number, :agency_number, :account_balance, presence: true

  def balance_update(financial_transaction_id)
    financial_transaction = financial_transactions.pluck(financial_transaction_id)
    financial_transaction.withdraw? ? update(account_balance: account_balance - financial_transaction.amount) : update(account_balance: account_balance + financial_transaction.amount)
  end
end
