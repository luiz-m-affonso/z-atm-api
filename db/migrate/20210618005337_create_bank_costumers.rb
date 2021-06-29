class CreateBankCostumers < ActiveRecord::Migration[6.1]
  def change
    create_table :bank_costumers, id: :uuid do |t|
      t.string :cpf
      t.string :password_digest

      t.timestamps
    end
  end
end
