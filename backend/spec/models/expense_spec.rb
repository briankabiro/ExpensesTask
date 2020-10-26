require 'rails_helper'

describe Expense do
  let(:test_account) { Account.create(name: 'lee', number: '1212134') }
  let(:test_account_2) { Account.create(name: 'braninho', number: '1212131s') }

  let(:expense) { Expense.create(amount: 500, date: Date.today, account: test_account, description: 'boots') }
  let(:expense_2) { Expense.new(amount: 12000, date: Date.today, account: test_account, description: 'plates') }

  context 'creating an account' do
    it 'deducts the balance from the account' do
      account_balance = expense.account.reload.balance

      expect(account_balance).to eq(500)
    end

    it 'does not assign an expense with value more than account' do
      expect { expense_2.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end  
  end
end