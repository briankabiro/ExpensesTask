require 'rails_helper'

RSpec.describe Account, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:number) }

    it 'ensures balance is is an integer greater than 0 and less than 1000' do
       is_expected.to validate_numericality_of(:balance).only_integer
        .is_greater_than_or_equal_to(0)
        .is_less_than_or_equal_to(1000)
    end

    context 'associations' do
      it { should have_many(:expenses) }
    end

    context 'uniqueness' do
      subject { Account.create(name: 'runtown', number: '123456bm') }

      it { should validate_uniqueness_of(:name) }
      it { should validate_uniqueness_of(:number) }
    end

    context 'balance' do
      let(:account) { Account.new(name: 'runtown', number: '123456bm') }

      it 'raises error when trying to set initial balance' do
        account.update(balance: 100)
        account.save!

        expect(account.balance).to eq(1000)
      end

      it 'raises error when balance is less than 0' do
        account.save!

        expect { account.update!(balance: -10) }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
