class CreateStockQuotes < ActiveRecord::Migration[6.0]
  def change
    create_table :stock_quotes do |t|
      t.string :stock_code, foreign_key: true
      t.float :change
      t.string :change_percent_s
      t.string :latest_time
      t.float :latest_price

      t.timestamps
    end
  end
end
