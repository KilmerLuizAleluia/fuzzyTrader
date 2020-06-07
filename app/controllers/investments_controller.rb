class InvestmentsController < ApplicationController
  def new
    @investment = Investment.new(asset_amount: params['asset_amount'])
    # bitcoin = [{ symbol: 'BTC', price: @investment.retrieve_bitcoin, fifty_two_week_high: "NA", fifty_two_week_low: "NA"}]
    bitcoin = [{ symbol: 'BTC', price: 100, fifty_two_week_high: "NA", fifty_two_week_low: "NA"}]
    @assets_list = @investment.retrieve_world_trade_data + bitcoin
  end

  def index
  end

  def buy
    amount = params[:money].to_f/params[:price].to_f
    @investment = Investment.new(name: params[:name], asset_amount: amount, portfolio: current_user.portfolio)
    respond_to do |format|
      if @investment.save
        format.html { redirect_to controller: 'portfolios', action: 'index', notice: 'New investment added to Portfolio!'}
      else
        format.html { render :edit }
        format.json { render json: @memory.errors, status: :unprocessable_entity }
      end
    end
  end

  def investment_params
    params.require(:memory).permit(:description, :date, :weather, :local, :user_id)
  end

end
