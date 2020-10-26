class Expense < ApplicationRecord
  validates :amount, :date, :description, presence: true
  validates :amount, numericality: { greater_than: 0, only_integer: true }

  belongs_to :account

  after_commit :update_account, on: :create

  def update_account
    account = Account.find(account_id)

    new_balance = account.balance - amount

    account.update!(balance: new_balance)
  end
end
