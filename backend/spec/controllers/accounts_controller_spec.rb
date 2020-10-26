require 'rails_helper'

RSpec.describe AccountsController do
  let(:account) do
    Account.create(name: 'lee', number: 't123-sdsd')
  end

  let(:valid_params) do
    {
      'name': 'lee',
      'number': '123'
    }
  end

  describe '#index' do
    context 'when no account is present' do
      it 'returns an empty array' do
        get :index

        expect(json).to be_empty
      end
    end

    context 'when account is present' do
      let!(:new_account) { Account.create(name: 'bkkk', number: 't123-sdsd') }

      it 'returns correct number of accounts' do
        get :index
        
        expect(json.size).to eq(1)
      end
    end
  end

  describe '#create' do
    context 'valid params' do
      before do
        post :create, params: valid_params
      end

      it 'creates an account' do
        expect(Account.all.size).to eq(1)

        expect(json['name']).to eq('lee')
        expect(json['number']).to eq('123')
      end
    end

    context 'invalid params' do
      
    end
  end

  describe '#update' do
    it 'updates account name' do
      put :update, params: { 'name': 'bondicat', 'id': account.id }

      expect(json['name']).to eq('bondicat')
    end

    it 'updates the account number' do
      put :update, params: { 'number': '1213', 'id': account.id }

      expect(json['number']).to eq('1213')
    end

    it 'cannot update the balance' do
      put :update, params: { 'balance': '20', 'id': account.id }

      expect(json['balance']).to eq(1000)
    end
  end

  describe '#delete' do
    it 'deletes the account' do
      delete :destroy, params: { id: account.id }

      expect(json['name']).to eq(account.name)
      expect(Account.all.size).to eq(0)
    end
  end
end