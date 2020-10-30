# frozen_string_literal: true

FactoryBot.define do
  factory :activity do
    name { 'MyString' }
    start_date { '2020-10-30' }
    end_date { '2020-11-30' }
    finished { false }
    project
  end
end
