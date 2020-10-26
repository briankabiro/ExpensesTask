require 'rails_helper'

describe ExpensesController do
  let(:test_account) { Account.create(name: 'account_one', number: '1212134') }
  let(:test_account_2) { Account.create(name: 'account_two', number: '12121s') }

  let!(:expense) { Expense.create(amount: 500, date: Date.today, account: test_account, description: 'food') }
  let!(:expense_2) { Expense.create(amount: 120, date: Date.today, account: test_account_2, description: 'clothes') }

  describe '#update' do
    context 'updates params' do
      before do
        put :update, as: :json, params: { 'amount': 300, 'description': 'plants', 'date': Date.yesterday, 'id': expense.id }
      end

      it 'updates attributes' do
        expect(json['amount']).to eq(300)
        expect(json['description']).to eq('plants')
      end
    end

    context 'updating an account' do
      before do
        patch :update, params: { 'expense': { 'account': test_account_2.id }, 'id': expense.id }
      end

      it 'reassigns the expense correctly' do
        expect(json['account_id']).to eq(test_account_2.id)

        expect(test_account_2.reload.balance).to eq(380)
        expect(test_account.reload.balance).to eq(1000)
      end
    end
  end
end
