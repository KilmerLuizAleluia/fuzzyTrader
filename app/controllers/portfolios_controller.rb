class PortfoliosController < ApplicationController
  def index
    @investments = current_user.portfolio.investments
  end
end
