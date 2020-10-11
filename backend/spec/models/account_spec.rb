require 'rails_helper'

RSpec.describe 'Account', type: :model do
  context 'validations' do
    it { should validate_presence_of(:account_name) }
    it { should validate_presence_of(:account_number) }
    it { should validate_presence_of(:balance) }
  end

  context 'associations' do
    it { should have_many(:expenses) }
  end
end