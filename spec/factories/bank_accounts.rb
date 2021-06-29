FactoryBot.define do
  factory :bank_account do
    account_number { "MyString" }
    agency_number { "MyString" }
    account_balance { "9.99" }
  end
end
