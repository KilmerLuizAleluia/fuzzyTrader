# frozen_string_literal: true

class Investment < ApplicationRecord
  belongs_to :portfolio
  validates :name, :asset_amount, presence: true

  def dollar_value
    price = if name.eql? 'BTC'
              retrieve_btc_price
            else
              retrieve_price_by_symbol
            end
    price * asset_amount
  end

  def retrieve_btc_price
    response = RestClient.get(ApplicationController.helpers.pricing_block_chain_url)
    JSON.parse(response.body)['USD']['sell']
    # 6650.3
  end

  def retrieve_price_by_symbol
    # response = RestClient.get(ApplicationController.helpers.world_trading_data_url(self.name))
    # JSON.parse(response.body)['data'].first['price']
    11.06
  end
end
