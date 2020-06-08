# frozen_string_literal: true

class PortfoliosController < ApplicationController
  # GET /portfolios/index
  def index
    @portfolio = current_user.portfolio
  end
end
