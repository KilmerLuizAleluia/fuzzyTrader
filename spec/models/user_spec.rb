# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'relations' do
    it { should have_one :portfolio }
  end

  context 'validations' do
    before :all do
      Investment.delete_all
      Portfolio.delete_all
      User.delete_all
    end

    describe 'fail' do
      it 'is not valid without a first_name' do
        user = User.new(first_name: nil, last_name: 'Luiz', email: 'kl@email.com', password: 'passwd')
        expect(user).to_not be_valid
      end
      it 'is not valid without a last_name' do
        user = User.new(first_name: 'Kilmer', last_name: nil, email: 'kl@email.com', password: 'passwd')
        expect(user).to_not be_valid
      end
      it 'is not valid without a email' do
        user = User.new(first_name: 'Kilmer', last_name: 'Luiz', email: nil, password: 'passwd')
        expect(user).to_not be_valid
      end
    end

    describe 'success' do
      it 'should be valid user' do
        user = User.new(first_name: 'Kilmer', last_name: 'Luiz', email: 'kilmer@ale.com', password: 'passwrd')
        expect(user).to be_valid
      end
    end
  end

  context 'callbacks' do
    it 'should create portolio after creating user' do
      portfolio_count = Portfolio.count
      user = User.create(first_name: 'Kilmer', last_name: 'Luiz', email: 'kilmer@ale.com', password: 'passwrd')
      expect(Portfolio.count).to eq(portfolio_count + 1)
    end
  end

  context 'methods' do
    describe '#full_name' do
      it 'should show full name' do
        user = FactoryBot.create(:user, first_name: 'Comodo', last_name: 'Incomodo')
        expect(user.full_name).to eq 'Comodo Incomodo'
      end
    end
  end
end
