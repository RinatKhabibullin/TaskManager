FactoryBot.define do
  sequence :string do |n|
    "string#{n}"
  end
  sequence :name do |n|
    "name_#{n}"
  end
  sequence :description do |n|
    "description_#{n}"
  end
  sequence :first_name do |n|
    "first_name_#{n}"
  end
  sequence :last_name do |n|
    "last_name_#{n}"
  end
  sequence :password do |n|
    "password_#{n}"
  end
  sequence :email do |n|
    "email#{n}@factory.com"
  end
  sequence :avatar do |n|
    "image#{n}"
  end
end
