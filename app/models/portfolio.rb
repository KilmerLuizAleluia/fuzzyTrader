class Portfolio < ApplicationRecord
  has_many :investments
  belongs_to :user

  def dollar_value
    total = 0
    self.investments.each do |inv|
      total += inv.dollar_value
    end
    total
  end
end
