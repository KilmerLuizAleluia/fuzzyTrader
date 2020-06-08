# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PortfoliosController, type: :controller do
  describe '#index' do
    before :all do
      Investment.delete_all
      Portfolio.delete_all
      User.delete_all

      @user = FactoryBot.create :user
      @user2 = FactoryBot.create :user
      @portfolio = @user.portfolio
      @portfolio2 = @user.portfolio
      i1 = Investment.create(asset_amount: '5', portfolio: @portfolio, name: 'BTC')
      i2 = Investment.create(asset_amount: '3', portfolio: @portfolio, name: 'SNAP')
      i3 = Investment.create(asset_amount: '1', portfolio: @portfolio, name: 'TWTR')
      @portfolio.investments << i1
      @portfolio.investments << i2
      @portfolio.investments << i3
    end

    it 'should retrieve all current @user1 investments (3)' do
      sign_in @user
      get :index
      portfolio = assigns(:portfolio)
      expect(portfolio.user).to eq @user
      expect(portfolio.investments.count).to eq 3
    end
    it 'should retrieve all current @user2 investments (0)' do
      sign_in @user2
      get :index
      portfolio = assigns(:portfolio)
      expect(portfolio.user).to eq @user2
      expect(portfolio.investments.count).to eq 0
    end
  end
end
