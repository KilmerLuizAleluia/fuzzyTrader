class Investment < ApplicationRecord
  belongs_to :portfolio

  def retrieve_bitcoin
    response = RestClient.get(block_chain_api_path)
    JSON.parse(response.body)
  end

  def retrieve_world_trade_data
    # using only 20 pre selected symbols -- free API version is very limited. E.g, only 5 sybols per request.
    response1 = RestClient.get(world_trading_data_path("ACRE,SNAP,TWTR,VAPO,IMLP"))
    json1 = JSON.parse(response1.body)['data']
    assets1 = json1.map { |asset| {symbol: asset['symbol'], price: asset['price'], fifty_twoweek_high: asset['52_week_high'], fifty_two_week_low: asset['52_week_low']} }

    response2 = RestClient.get(world_trading_data_path("DTO,EARN,FIVA,GOAT,INDU.BA"))
    json2 = JSON.parse(response2.body)['data']
    assets2 = json2.map { |asset| {symbol: asset['symbol'], price: asset['price'], fifty_two_week_high: asset['52_week_high'], fifty_two_week_low: asset['52_week_low']} }

    response3 = RestClient.get(world_trading_data_path("KIM-L,ORCL,PARRO.PA,RMM,SHA.DE"))
    json3 = JSON.parse(response3.body)['data']
    assets3 = json3.map { |asset| {symbol: asset['symbol'], price: asset['price'], fifty_two_week_high: asset['52_week_high'], fifty_two_week_low: asset['52_week_low']} }

    response4 = RestClient.get(world_trading_data_path("SIM,TBIRD.PA,TKAT,USTB,UUUU"))
    json4 = JSON.parse(response4.body)['data']
    assets4 = json4.map { |asset| {symbol: asset['symbol'], price: asset['price'], fifty_two_week_high: asset['52_week_high'], fifty_two_week_low: asset['52_week_low']} }

    assets1 + assets2 + assets3 + assets4
  end

  def block_chain_api_path
    "https://blockchain.info/tobtc?currency=USD&value=#{self.asset_amount}"
  end

  def world_trading_data_path(symbols)
    "https://api.worldtradingdata.com/api/v1/stock?symbol=#{symbols},&api_token=FKdyTK3KiM8iD5ujF7RpsTCSPhE2ry8zedKct8fSobXKNOgD12vjZkssiK8q"
  end
end
