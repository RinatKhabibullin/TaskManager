FactoryBot.define do
  factory :user do
    first_name
    last_name
    password
    email
    avatar
    type
  end

  factory :developer do
    first_name
    last_name
    password
    email
    avatar
    type { "Developer" }
  end

  factory :manager do
    first_name
    last_name
    password
    email
    avatar
    type { "Manager" }
  end

  factory :admin do
    first_name
    last_name
    password
    email
    avatar
    type { "Admin" }
  end
end
