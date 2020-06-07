class PortfoliosController < ApplicationController
  def index
    @portfolio = current_user.portfolio
  end
end
