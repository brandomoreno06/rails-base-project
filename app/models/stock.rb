class Stock < ApplicationRecord
  has_many :trades, dependent: :destroy
  has_many :stocks, through: :trades

  validates :code, presence: true
  validates :name, presence: true
  validates :current_price, presence: true, numericality: { greater_than: 0 }
end
