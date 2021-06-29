class BankCostumer < ApplicationRecord
  has_secure_password
  has_one :bank_account, dependent: :destroy
  has_many :financial_transactions, through: :bank_account
  validates :cpf, presence: true, uniqueness: true
end
