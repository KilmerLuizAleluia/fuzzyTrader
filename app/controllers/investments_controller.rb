class InvestmentsController < ApplicationController
  # GET /memories/new
  def new
    @investment = Investment.new(asset_amount: params['asset_amount'])
    @bitcoin_value = @investment.retrieve_bitcoin
    @assets_list = @investment.retrieve_world_trade_data
  end

  def index
  end
end
