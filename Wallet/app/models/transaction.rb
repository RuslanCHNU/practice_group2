# app/models/transaction.rb

class Transaction < ApplicationRecord
    validates :name, presence: true
    validates :amount, presence: true, numericality: { other_than: 0 }
    validates :date, presence: true
  end
  