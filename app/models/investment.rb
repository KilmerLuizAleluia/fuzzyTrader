class Investment < ApplicationRecord
  belongs_to :portfolio

  def retrieve_bitcoin
    # response = RestClient.get(block_chain_api_path)
    # JSON.parse(response.body)
    390
  end

  def retrieve_world_trade_data
    # using only 20 pre selected symbols -- free API version is very limited. E.g, only 5 sybols per request.
    # response1 = RestClient.get(world_trading_data_path("ACRE,SNAP,TWTR,VAPO,IMLP"))
    # json1 = JSON.parse(response1.body)['data']
    # assets1 = json1.map { |asset| {symbol: asset['symbol'], price: asset['price'], fifty_twoweek_high: asset['fifty_two_week_high'], fifty_two_week_low: asset['fifty_two_week_low']} }
    #
    # response2 = RestClient.get(world_trading_data_path("DTO,EARN,FIVA,GOAT,INDU.BA"))
    # json2 = JSON.parse(response2.body)['data']
    # assets2 = json2.map { |asset| {symbol: asset['symbol'], price: asset['price'], fifty_two_week_high: asset['fifty_two_week_high'], fifty_two_week_low: asset['fifty_two_week_low']} }
    #
    # response3 = RestClient.get(world_trading_data_path("KIM-L,ORCL,PARRO.PA,RMM,SHA.DE"))
    # json3 = JSON.parse(response3.body)['data']
    # assets3 = json3.map { |asset| {symbol: asset['symbol'], price: asset['price'], fifty_two_week_high: asset['fifty_two_week_high'], fifty_two_week_low: asset['fifty_two_week_low']} }
    #
    # response4 = RestClient.get(world_trading_data_path("SIM,TBIRD.PA,TKAT,USTB,UUUU"))
    # json4 = JSON.parse(response4.body)['data']
    # assets4 = json4.map { |asset| {symbol: asset['symbol'], price: asset['price'], fifty_two_week_high: asset['fifty_two_week_high'], fifty_two_week_low: asset['fifty_two_week_low']} }
    #
    # assets1 + assets2 + assets3 + assets4

    [{:symbol=>"ACRE", :price=>13, :"fifty_two_week_high"=>14, :"fifty_two_week_low"=>9},
     {:symbol=>"IMLP", :price=>52, :"fifty_two_week_high"=>52, :"fifty_two_week_low"=>20},
     {:symbol=>"SNAP", :price=>62, :"fifty_two_week_high"=>80, :"fifty_two_week_low"=>40},
     {:symbol=>"TWTR", :price=>59, :"fifty_two_week_high"=>90, :"fifty_two_week_low"=>50},
     {:symbol=>"VAPO", :price=>70, :"fifty_two_week_high"=>110, :"fifty_two_week_low"=>20},
     {:symbol=>"DTO", :price=>80, :"fifty_two_week_high"=>120, :"fifty_two_week_low"=>30},
     {:symbol=>"EARN", :price=>90, :"fifty_two_week_high"=>130, :"fifty_two_week_low"=>60},
     {:symbol=>"FIVA", :price=>100, :"fifty_two_week_high"=>140, :"fifty_two_week_low"=>60},
     {:symbol=>"GOAT", :price=>90, :"fifty_two_week_high"=>150, :"fifty_two_week_low"=>60},
     {:symbol=>"INDU.BA", :price=>80, :"fifty_two_week_high"=>160, :"fifty_two_week_low"=>40},
     {:symbol=>"KIM-L", :price=>70, :"fifty_two_week_high"=>155, :"fifty_two_week_low"=>30},
     {:symbol=>"ORCL", :price=>60, :"fifty_two_week_high"=>160, :"fifty_two_week_low"=>40},
     {:symbol=>"PARRO.PA", :price=>50, :"fifty_two_week_high"=>145, :"fifty_two_week_low"=>30},
     {:symbol=>"RMM", :price=>55, :"fifty_two_week_high"=>140, :"fifty_two_week_low"=>55},
     {:symbol=>"SHA.DE", :price=>65, :"fifty_two_week_high"=>120, :"fifty_two_week_low"=>55},
     {:symbol=>"SIM", :price=>70, :"fifty_two_week_high"=>110, :"fifty_two_week_low"=>65},
     {:symbol=>"TBIRD.PA", :price=>75, :"fifty_two_week_high"=>100, :"fifty_two_week_low"=>50},
     {:symbol=>"TKAT", :price=>80, :"fifty_two_week_high"=>81, :"fifty_two_week_low"=>40},
     {:symbol=>"USTB", :price=>85, :"fifty_two_week_high"=>90, :"fifty_two_week_low"=>10},
     {:symbol=>"UUUU", :price=>90, :"fifty_two_week_high"=>91, :"fifty_two_week_low"=>40}]

  end

  def block_chain_api_path
    "https://blockchain.info/tobtc?currency=USD&value=#{self.asset_amount}"
  end

  def world_trading_data_path(symbols)
    "https://api.worldtradingdata.com/api/v1/stock?symbol=#{symbols},&api_token=FKdyTK3KiM8iD5ujF7RpsTCSPhE2ry8zedKct8fSobXKNOgD12vjZkssiK8q"
  end
end
