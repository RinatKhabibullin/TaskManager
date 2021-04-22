FactoryBot.define do
  factory :task do
    name { generate :string }
    description { generate :string }
    author factory: :manager
    assignee factory: :developer
    traits_for_enum(:state, ['new_task', 'in_development', 'in_qa', 'in_code_review', 'ready_for_release', 'released', 'archived'])
    expired_at
  end
end
