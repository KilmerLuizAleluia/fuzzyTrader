require 'rails_helper'

RSpec.describe Portfolio, type: :model do
  context 'relations' do
    it { should have_many :investments }
    it { should belong_to :user }
  end

  context 'methods' do
    before :all do
      Investment.delete_all
      Portfolio.delete_all
      User.delete_all
    end
    describe '#dollar_value' do
      it 'should sum all investment values' do
        allow_any_instance_of(Investment).to receive(:retrieve_price_by_symbol).and_return(5)

        User.delete_all
        user = FactoryBot.create :user
        portfolio = user.portfolio
        Investment.create(name: 'i1', asset_amount: '10', portfolio: portfolio)
        Investment.create(name: 'i2', asset_amount: '5', portfolio: portfolio)
        Investment.create(name: 'i3', asset_amount: '2', portfolio: portfolio)
        expect(portfolio.dollar_value).to eq 85 #10*5 + 5*5 + 2*5
      end
      it 'should sum all investment values for btc' do
        allow_any_instance_of(Investment).to receive(:retrieve_btc_price).and_return(12)

        User.delete_all
        user = FactoryBot.create :user
        portfolio = user.portfolio
        Investment.create(name: 'BTC', asset_amount: '5', portfolio: portfolio)
        Investment.create(name: 'BTC', asset_amount: '3', portfolio: portfolio)
        Investment.create(name: 'BTC', asset_amount: '1', portfolio: portfolio)
        expect(portfolio.dollar_value).to eq 108 #5*12 + 3*12 + 1*12
      end
      it 'should sum all investment values for mixed assets' do
        allow_any_instance_of(Investment).to receive(:retrieve_price_by_symbol).and_return(5)
        allow_any_instance_of(Investment).to receive(:retrieve_btc_price).and_return(12)

        User.delete_all
        user = FactoryBot.create :user
        portfolio = user.portfolio
        Investment.create(name: 'SNAP', asset_amount: '4', portfolio: portfolio)
        Investment.create(name: 'TWTR', asset_amount: '2', portfolio: portfolio)
        Investment.create(name: 'BTC', asset_amount: '1', portfolio: portfolio)
        expect(portfolio.dollar_value).to eq 42 #4*5 + 2*5 + 1*12
      end
    end
  end
end
