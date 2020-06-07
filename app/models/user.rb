# frozen_string_literal: true

class User < ApplicationRecord
  has_one :portfolio, dependent: :nullify
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, presence: true
  after_create :create_portfolio

  def full_name
    first_name + ' ' + last_name
  end

  def create_portfolio
    Portfolio.create(user: self)
  end
end
