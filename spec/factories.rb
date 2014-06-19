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
end
