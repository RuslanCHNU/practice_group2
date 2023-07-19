# app/models/transaction.rb

class Transaction < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true, numericality: { other_than: 0 }
  validate :date_cannot_be_future

  private

  def date_cannot_be_future
    if date.present? && date > Date.current
      errors.add(:date, 'cannot be a future date')
    end
  end
end
