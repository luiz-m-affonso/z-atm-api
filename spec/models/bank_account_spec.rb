require 'rails_helper'

RSpec.describe BankAccount, type: :model do
  subject(:bank_account) { create(:bank_account) }

  describe "validations" do
    it { is_expected.to validates_presence_of(:account_number)}
    it { is_expected.to validates_presence_of(:account_balance)}
    it { is_expected.to validates_presence_of(:agency_number)}
  end
end
