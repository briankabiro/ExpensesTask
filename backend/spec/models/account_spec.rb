require 'rails_helper'

RSpec.describe Account, type: :model do
  context 'validations' do
    it { should validate_presence_of(:account_name) }
    it { should validate_presence_of(:account_number) }
    it 'ensures balance is is an integer greater than 0 and less than 1000' do
       is_expected.to validate_numericality_of(:balance).only_integer
        .is_greater_than_or_equal_to(0)
        .is_less_than_or_equal_to(1000)
    end

    context 'uniqueness' do
      subject { Account.create(account_name: 'runtown', account_number: 12011313) }

      it { should validate_uniqueness_of(:account_name) }
      it { should validate_uniqueness_of(:account_number) }
      it { should validate_absence_of(:balance) }
    end
  end

  context 'associations' do
    it { should have_many(:expenses) }
  end
end