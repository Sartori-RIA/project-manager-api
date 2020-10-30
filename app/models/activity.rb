class Activity < ApplicationRecord
  belongs_to :project
  validates :name, :start_date, :end_date, presence: true
  validates :end_date, date: {after_or_equal_to: :start_date}

end
