require 'rails_helper'

RSpec.describe FinancialTransaction, type: :model do
  subject(:financial_transaction) { create(:financial_transaction) }

  describe 'validations' do
    it { is_expected.to validates_presence_of(:amount) }
    it { is_expected.to validates_presence_of(:type) }
  end
end
