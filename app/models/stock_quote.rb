class StockQuote < ApplicationRecord
  belongs_to :stock, foreign_key: 'stock_code', inverse_of: :stock_quote

  validates :latest_price, presence: true, numericality: { greater_than: 0 }
end
