# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_role, class: Role do
    name "user"
  end

  factory :admin_role, class: Role do
    name "admin"
  end
end
