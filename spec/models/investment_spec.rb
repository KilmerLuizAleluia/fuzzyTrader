# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Investment, type: :model do
  context 'relations' do
    it { should belong_to :portfolio }
  end

  context 'model methods' do
    describe '#dollar_value' do
      before :all do
        Investment.delete_all
        Portfolio.delete_all
        User.delete_all

        @user = FactoryBot.create(:user)
        @portfolio = Portfolio.create(user: @user)
      end
      it 'should sum BTC value' do
        allow_any_instance_of(Investment).to receive(:retrieve_btc_price).and_return(5)
        inv = Investment.create(asset_amount: '5', portfolio: @portfolio, name: 'BTC')
        expect(inv.dollar_value).to eq 25
      end
      it 'should sum other asset value' do
        allow_any_instance_of(Investment).to receive(:retrieve_price_by_symbol).and_return(3)
        inv = Investment.create(asset_amount: '7', portfolio: @portfolio, name: 'SNAP')
        expect(inv.dollar_value).to eq 21
      end
    end
  end
end
