FactoryBot.define do
  sequence :string, aliases: [:first_name, :last_name, :password, :name, :description] do |n|
    "string#{n}"
  end
  sequence :email do |n|
    "email#{n}@example.com"
  end
  sequence :type do |n|
    "type#{
      if n % 3 == 0
        "Developer"
      elsif n % 3 == 1
        "Admin"
      else
        "Manager"
      end
    }"
  end
  sequence :avatar do |n|
    "image#{n}"
  end
  sequence :state do |n|
    "state#{
      if n % 7 == 0
        "new_task"
      elsif n % 7 == 1
        "in_development"
      elsif n % 7 == 2
        "in_qa"
      elsif n % 7 == 3
        "in_code_review"
      elsif n % 7 == 4
        "ready_for_release"
      elsif n % 7 == 5
        "released"
      else
        "archived"
      end
    }"
  end
  sequence :expired_at do |n|
    "2021.01.#{n}"
  end
end