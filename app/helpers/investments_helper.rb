# frozen_string_literal: true

# Investment Helper Retrieve assets for World Trading Data API and update or create new investment before
# adding it to Portfolio.
module InvestmentsHelper
  def retrieve_assets(symbols)
    response = RestClient.get(ApplicationController.helpers.world_trading_data_url(symbols))
    json = JSON.parse(response.body)['data']
    json.map do |asset|
      {
        symbol: asset['symbol'], price: asset['price'],
        fifty_two_week_high: asset['fifty_two_week_high'],
        fifty_two_week_low: asset['fifty_two_week_low']
      }
    end
  end

  def define_investment(amount)
    old_investment = current_user.portfolio.investments.where(name: params[:name]).first
    if old_investment
      amount += old_investment.asset_amount
      old_investment.asset_amount = amount
      investment = old_investment
    else
      investment = Investment.new(name: params[:name], asset_amount: amount, portfolio: current_user.portfolio)
    end
    investment
  end
end
