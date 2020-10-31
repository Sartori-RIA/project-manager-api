# frozen_string_literal: true

class Project < ApplicationRecord
  include PgSearch::Model

  acts_as_paranoid

  pg_search_scope :search,
                  against: %w[name]

  validates :name, :start_date, :end_date, presence: true
  validates :end_date, date: { after_or_equal_to: :start_date }

  has_many :activities, dependent: :delete_all
end
