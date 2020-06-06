class User < ApplicationRecord
  has_one :portfolio
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates_presence_of :first_name, :last_name

  def full_name
    first_name + ' ' + last_name
  end
end
