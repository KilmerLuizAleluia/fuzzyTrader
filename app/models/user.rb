class User < ApplicationRecord
  has_one :portfolio
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates_presence_of :first_name, :last_name
  after_create :create_portfolio

  def full_name
    first_name + ' ' + last_name
  end

  def create_portfolio
    Portfolio.create(user: self)
  end
end
