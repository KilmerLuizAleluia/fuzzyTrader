# frozen_string_literal: true

class Portfolio < ApplicationRecord
  has_many :investments, dependent: :nullify
  belongs_to :user

  def dollar_value
    total = 0
    investments.each do |inv|
      total += inv.dollar_value
    end
    total
  end
end
