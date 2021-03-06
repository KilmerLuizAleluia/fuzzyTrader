# frozen_string_literal: true

# URL helper for APIs (blockchainAPI and World Trading Data)
module UrlHelper
  def block_chain_api_url
    "https://blockchain.info/tobtc?currency=USD&value=#{asset_amount}"
  end

  def pricing_block_chain_url
    'https://blockchain.info/ticker'
  end

  def world_trading_data_url(symbols)
    "https://api.worldtradingdata.com/api/v1/stock?symbol=#{symbols},&api_token=#{ENV['WTD_KEY']}"
  end
end
