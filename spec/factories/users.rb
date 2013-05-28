# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name 'Morshed'
    last_name 'Alam'
    email 'morshed@nsbench.com'
    password 'morshed'
    password_confirmation 'morshed'
  end
end
