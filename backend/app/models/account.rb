class Account < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :number, presence: true, uniqueness: true

  validates :balance, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 1000
  }

  has_many :expenses, dependent: :destroy

  after_commit :set_balance_to_1000, on: :create

  def set_balance_to_1000
    self.balance = 1000
  end
end
