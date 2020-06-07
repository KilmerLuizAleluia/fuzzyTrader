FactoryBot.define do
  factory :portfolio do
    before(:create) do |portfolio|
      portfolio.user = FactoryBot.build(:user)
    end
  end
end
