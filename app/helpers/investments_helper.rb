module InvestmentsHelper
  def retrieve_assets(symbols)
    response = RestClient.get(ApplicationController.helpers.world_trading_data_url(symbols))
    json = JSON.parse(response.body)['data']
    json.map { |asset| {symbol: asset['symbol'], price: asset['price'], fifty_twoweek_high: asset['fifty_two_week_high'], fifty_two_week_low: asset['fifty_two_week_low']} }
  end

  def set_investment(old_investment, amount)
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
