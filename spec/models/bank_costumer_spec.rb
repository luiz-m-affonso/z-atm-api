require 'rails_helper'

RSpec.describe BankCostumer, type: :model do
  subject(:bank_costumer) { create(:bank_costumer) }
  describe 'validations' do
    it { is_expected.to validates_presence_of(:cpf)}
    it { is_expected.to validates_uniqueness_of(:cpf)}
  end
end
