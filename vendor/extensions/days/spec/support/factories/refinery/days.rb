
FactoryGirl.define do
  factory :day, :class => Refinery::Days::Day do
    sequence(:day) { |n| "refinery#{n}" }
  end
end

