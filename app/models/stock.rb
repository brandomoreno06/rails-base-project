class Stock < ApplicationRecord
  self.primary_key = 'code'
  has_many :trades, dependent: :destroy, foreign_key: 'stock_code', inverse_of: :stock
  has_many :users, through: :trades
  has_one :stock_quote, dependent: :destroy, foreign_key: 'stock_code', inverse_of: :stock

  validates :code, presence: true
  validates :name, presence: true
end
