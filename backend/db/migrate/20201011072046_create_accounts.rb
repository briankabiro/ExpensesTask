class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :account_name, null: false
      t.integer :account_number, null: false
      t.integer :balance, default: 1000, null: false

      t.timestamps
    end
  end
end
