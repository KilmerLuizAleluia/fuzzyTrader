# frozen_string_literal: true

class InvestmentsController < ApplicationController
  def index; end

  def new
    @investment = Investment.new(asset_amount: params['asset_amount'])
    bitcoin = [{ symbol: 'BTC', price: @investment.retrieve_btc_price, fifty_two_week_high: 'NA',
                 fifty_two_week_low: 'NA' }]
    @assets_list = retrieve_world_trade_data + bitcoin
  end

  def buy
    amount = params[:money].to_f/params[:price].to_f
    @investment = helpers.define_investment(amount)
    save_and_redirect
  end

  def retrieve_world_trade_data
    # assets = []
    # assets += helpers.retrieve_assets("ACRE,SNAP,TWTR,VAPO,IMLP")
    # assets += helpers.retrieve_assets("DTO,EARN,FIVA,GOAT,INDU.BA")
    # assets += helpers.retrieve_assets("KIM-L,ORCL,PARRO.PA,RMM,SHA.DE")
    # assets += helpers.retrieve_assets("SIM,TBIRD.PA,TKAT,USTB,UUUU")
    # assets
    #
    #
    [{ symbol: 'ACRE', price: 13, 'fifty_two_week_high': 14, 'fifty_two_week_low': 9 },
     { symbol: 'IMLP', price: 52, 'fifty_two_week_high': 52, 'fifty_two_week_low': 20 },
     { symbol: 'SNAP', price: 62, 'fifty_two_week_high': 80, 'fifty_two_week_low': 40 },
     { symbol: 'TWTR', price: 59, 'fifty_two_week_high': 90, 'fifty_two_week_low': 50 },
     { symbol: 'VAPO', price: 70, 'fifty_two_week_high': 110, 'fifty_two_week_low': 20 },
     { symbol: 'DTO', price: 80, 'fifty_two_week_high': 120, 'fifty_two_week_low': 30 },
     { symbol: 'EARN', price: 90, 'fifty_two_week_high': 130, 'fifty_two_week_low': 60 },
     { symbol: 'FIVA', price: 100, 'fifty_two_week_high': 140, 'fifty_two_week_low': 60 },
     { symbol: 'GOAT', price: 90, 'fifty_two_week_high': 150, 'fifty_two_week_low': 60 },
     { symbol: 'INDU.BA', price: 80, 'fifty_two_week_high': 160, 'fifty_two_week_low': 40 },
     { symbol: 'KIM-L', price: 70, 'fifty_two_week_high': 155, 'fifty_two_week_low': 30 },
     { symbol: 'ORCL', price: 60, 'fifty_two_week_high': 160, 'fifty_two_week_low': 40 },
     { symbol: 'PARRO.PA', price: 50, 'fifty_two_week_high': 145, 'fifty_two_week_low': 30 },
     { symbol: 'RMM', price: 55, 'fifty_two_week_high': 140, 'fifty_two_week_low': 55 },
     { symbol: 'SHA.DE', price: 65, 'fifty_two_week_high': 120, 'fifty_two_week_low': 55 },
     { symbol: 'SIM', price: 70, 'fifty_two_week_high': 110, 'fifty_two_week_low': 65 },
     { symbol: 'TBIRD.PA', price: 75, 'fifty_two_week_high': 100, 'fifty_two_week_low': 50 },
     { symbol: 'TKAT', price: 80, 'fifty_two_week_high': 81, 'fifty_two_week_low': 40 },
     { symbol: 'USTB', price: 85, 'fifty_two_week_high': 90, 'fifty_two_week_low': 10 },
     { symbol: 'UUUU', price: 90, 'fifty_two_week_high': 91, 'fifty_two_week_low': 40 }]
  end

  private

  def save_and_redirect
    respond_to do |format|
      if @investment.save
        format.html do
          redirect_to controller: 'portfolios', action: 'index', notice: 'New investment added to Portfolio!'
        end
      else
        format.html { render :new }
        format.json { render json: @investment.errors, status: :unprocessable_entity }
      end
    end
  end
end
