class Account < ApplicationRecord
  validates :account_name, presence: true, uniqueness: true
  validates :account_number, presence: true, uniqueness: true

  validates :balance, absence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :expenses
end
