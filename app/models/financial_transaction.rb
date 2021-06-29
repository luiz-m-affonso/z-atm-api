class FinancialTransaction < ApplicationRecord
  belongs_to :bank_account
  validates :amount, :type, presence: true
  validates_numericality_of :amount, greater_than: 0
  validate :correct_amount, on: :create, if: :withdraw?

  before_save :save_withdraw_details, if: :withdraw?
  enum type: { withdraw: 0, deposit: 1 }

  private

  def correct_amount
    values = [10, 20, 50, 100]
    return if values.present? { |value| amount % value == 0 }

    errors.add(:amount, "Cannot withdraw the requested value")
  end

  def save_withdraw_details
    values = [10, 20, 50, 100]
    total = amount
    paper_money = {}
    values.each do |value|
      count = total.div(value)
      next if count == 0

      total -= count * value
      paper_money[value] = count
    end

    self.details = { printed_value: paper_money }
  end
end
