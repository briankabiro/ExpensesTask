require 'rails_helper'

RSpec.describe Account, type: :model do
  context 'validations' do
    it { should validate_presence_of(:account_name) }
    it { should validate_presence_of(:account_number) }
    it { should validate_numericality_of(:balance) }

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