FactoryGirl.define do
  factory :tool do
    sequence(:name) { |n| "Tool #{n}" }
  end

  factory :project do
    sequence(:name) { |n| "Project #{n}" }
    sequence(:url) { |n| "site#{n}.com" }
  end

  factory :tool_project do
    project
    tool
  end

  factory :time_slot do
    started_at { 2.months.ago }
    ended_at { 1.month.ago }
    project
  end

  factory :company do
    sequence(:name) { |n| "Company №#{n}" }
    sequence(:started_at) { rand(1..12).months.ago }
  end
end
