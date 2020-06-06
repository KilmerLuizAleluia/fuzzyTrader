class InvestmentsController < ApplicationController
  # GET /memories/new
  def new
    @investment = Investment.new(asset_amount: params['asset_amount'])
  end

  def index
  end
end
