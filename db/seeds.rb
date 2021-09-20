require 'iex-ruby-client'
client = IEX::Api::Client.new

def map_stocks(stocks)
  stocks = stocks.map do |stock|
    { code: stock.symbol, name: stock.name }
  end
end

Stock.destroy_all
@stocks = map_stocks(client.ref_data_symbols_for_exchange('NAS').first(10))
Stock.create!(@stocks)

Stock.all.map do |stock|
  quote = client.quote(stock.code)

  if quote.latest_price == nil || quote.latest_price == 0
    stock.delete
    next
  end

  StockQuote.create!(stock_code: stock.code, change: quote.change, change_percent_s: quote.change_percent_s, latest_time: quote.latest_time, latest_price: quote.latest_price)
end

puts "Created #{Stock.count} stocks"
puts "Created stock quotes"