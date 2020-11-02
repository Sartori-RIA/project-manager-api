# frozen_string_literal: true

class Activity < ApplicationRecord
  belongs_to :project
  validates :name, :start_date, :end_date, presence: true
  validates :end_date, date: { after_or_equal_to: :start_date }
  after_create :calculate_project_progress
  after_update :calculate_project_progress

  protected

  def calculate_project_progress
    project = Project.find_by(id: project_id)
    size = Activity.where(project_id: project_id).count
    finished_activities = Activity.where(project_id: project_id, finished: true).count

    percent = (BigDecimal(finished_activities) / BigDecimal(size)) * 100

    project.update(progress: percent, delayed: end_date > project.end_date)
  end
end
