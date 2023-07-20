FactoryBot.define do
  factory :admin_user do
    username { 'matt' }
    email { 'mseidholz@gmail.com' }
    is_admin { true }
  end

  factory :regular_user do
    username { 'Joe' }
    email { 'joe@gmail.com' }
    is_admin { false }
  end
end
