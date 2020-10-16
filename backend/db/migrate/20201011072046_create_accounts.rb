class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :name, null: false
      t.integer :number, null: false
      t.integer :balance, default: 1000, null: false

      t.timestamps
    end
  end
end
