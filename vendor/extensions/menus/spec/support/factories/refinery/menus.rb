
FactoryGirl.define do
  factory :menu, :class => Refinery::Menus::Menu do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

