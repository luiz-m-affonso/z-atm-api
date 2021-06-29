class CreateBankAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :bank_accounts, id: :uuid do |t|
      t.string :account_number
      t.string :agency_number
      t.decimal :account_balance, null: false, default: 0.0

      t.timestamps
    end
  end
end
