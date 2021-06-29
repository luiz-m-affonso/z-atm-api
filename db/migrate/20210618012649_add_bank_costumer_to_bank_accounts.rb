class AddBankCostumerToBankAccounts < ActiveRecord::Migration[6.1]
  def change
    add_reference :bank_accounts, :bank_costumer, type: :uuid, foreign_key: true
  end
end
