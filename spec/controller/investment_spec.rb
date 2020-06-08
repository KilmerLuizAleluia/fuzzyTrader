# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InvestmentsController, type: :controller do
  describe 'buy' do
    before :all do
      Investment.delete_all
      Portfolio.delete_all
      User.delete_all

      @user = FactoryBot.create :user
      @portfolio = @user.portfolio
    end

    it 'buying BTC' do
      sign_in @user
      post :buy, params: { money: 500, price: 1000, name: 'BTC' }
      expect(@portfolio.investments.count).to eq 1
      expect(@portfolio.investments.first.name).to eq 'BTC'
      expect(@portfolio.investments.first.asset_amount).to eq 0.5
    end

    it 'buying other asset' do
      sign_in @user
      post :buy, params: { money: 1500, price: 500, name: 'SNAP' }
      post :buy, params: { money: 250, price: 250, name: 'TWTR' }
      expect(@portfolio.investments.count).to eq 2
      expect(@portfolio.investments.first.name).to eq 'SNAP'
      expect(@portfolio.investments.first.asset_amount).to eq 3
      expect(@portfolio.investments.second.name).to eq 'TWTR'
      expect(@portfolio.investments.second.asset_amount).to eq 1
    end

    it 'sending wrong data' do
      sign_in @user
      post :buy, params: {}
      investment = assigns(:investment)
      expect(@portfolio.investments.count).to eq 0
      expect(investment.errors.messages).to have_key(:name)
    end
  end

  describe 'new' do
    before :all do
      @user = FactoryBot.create :user
      @portfolio = @user.portfolio
    end

    it 'should set investment amount and list assets' do
      sign_in @user
      post :new, params: { asset_amount: '500' }
      investment = assigns(:investment)
      assets_list = assigns(:assets_list)
      expect(investment.asset_amount.to_i).to eql 500
      expect(assets_list.count).to eql 21 # BTC + 20 WTD assets
    end

    it 'should set asset to 0 when no value is given' do
      sign_in @user
      post :new, params: {}
      investment = assigns(:investment)
      assets_list = assigns(:assets_list)
      expect(investment.asset_amount.to_i).to eql 0
      expect(assets_list.count).to eql 21 # BTC + 20 WTD assets
    end
  end
end
