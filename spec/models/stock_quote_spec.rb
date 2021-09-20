require 'rails_helper'

RSpec.describe StockQuote, type: :model do
  context 'when validating associations' do
    it { is_expected.to belong_to(:stock).with_foreign_key('stock_code') }
  end

  context 'when validating presence' do
    it { is_expected.to validate_presence_of(:latest_price) }
  end

  context 'when validating values for numerals' do
    it { is_expected.to validate_numericality_of(:latest_price).is_greater_than(0) }
  end
end
