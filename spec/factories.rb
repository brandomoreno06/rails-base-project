FactoryBot.define do
  factory :user do
    email { 'email@test.com' }
    password { 'password' }
  end

  factory :stock do
    code { 'AAPL' }
    name { 'Apple' }
    # current_price { 1_000 }
  end

  factory :trade do
    stock_code { 'AAPL' }
    price { 1_000 }
    quantity { 100 }
    transaction_type { 'buy' }
    total_price { 100_000 }
    association :user
  end

  factory :wallet do
    running_balance { 1_000_000 }
    association :user
  end

  factory :user_stock do
    stock_code { 'AAPL' }
    quantity { 1_000 }
    association :user
  end

  factory :stock_quote do
    change { 10 }
    change_percent_s { '10%' }
    latest_time { 'September 17, 2021' }
    latest_price { 1_000 }
    association :stock
  end
end
