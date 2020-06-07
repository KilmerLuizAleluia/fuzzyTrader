class Investment < ApplicationRecord
  belongs_to :portfolio

  def dollar_value
    if self.name.eql? 'BTC'
      price = retrieve_btc_price
    else
      price = retrieve_price_by_symbol
    end
    price * self.asset_amount
  end

  def block_chain_api_url
    "https://blockchain.info/tobtc?currency=USD&value=#{self.asset_amount}"
  end

  def pricing_block_chain_url
    "https://blockchain.info/ticker"
  end

  def world_trading_data_url(symbols)
    "https://api.worldtradingdata.com/api/v1/stock?symbol=#{symbols},&api_token=#{ENV['WTD_KEY']}"
  end

  def retrieve_btc_price
    # response = RestClient.get(pricing_block_chain_url)
    # JSON.parse(response.body)['USD']['sell']
    6650.3
  end

  def retrieve_price_by_symbol
    # response = RestClient.get(world_trading_data_url(self.name))
    # JSON.parse(response.body)['data'].first['price']
    11.06
  end
end
