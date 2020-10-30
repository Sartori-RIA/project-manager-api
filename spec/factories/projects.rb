# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "project_#{n}" }
    start_date { '2020-10-30' }
    end_date { '2020-11-30' }
  end
end
