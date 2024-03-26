require 'httparty'

def crypto_price_tracker
  response = HTTParty.get('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd')

  coins = JSON.parse(response.body)
  coin_info = coins.map do |coin|
    {
      name: coin['id'],
      price: coin['current_price'],
      market_cap: coin['market_cap']
    }
  end
  coin_info.sort_by { |coin| coin[:market_cap] }.reverse
  puts "Top 5 Cryptocurrencies by Market Cap:"
  coin_info.first(5).each_with_index do |coin, index|
    puts "#{index + 1}. #{coin[:name]} - Price: $#{coin[:price]} - Market Cap: $#{coin[:market_cap]}"
  end
end

crypto_price_tracker
