# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::Projects::ActivitiesController, type: :request do
  let!(:project) { create(:project) }
  let!(:activities) { create_list(:activity, 10, project: project) }

  describe '#GET /api/projects/:project_id/activities' do
    it 'should request all project activities' do
      get api_project_activities_path(project_id: project.id),
          headers: unauthenticated_header
      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      json.each do |data|
        expect(data['project_id']).to eq(project.id)
      end
    end
  end

  describe '#GET /api/projects/:project_id/activities/:id' do
    let!(:activity) { activities.sample }
    it 'should request project activity by id' do
      get api_project_activity_path(
        id: activity.id,
        project_id: activity.project_id
      ), headers: unauthenticated_header
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#POST /api/projects/:project_id/activities' do
    it 'should create a project activity' do
      attributes = attributes_for(:activity)
      post api_project_activities_path(project_id: project.id),
           params: attributes.to_json,
           headers: unauthenticated_header
      expect(response).to have_http_status(:created)
    end
    it 'should throw error with invalid params' do
      post api_project_activities_path(project_id: project.id),
           params: {},
           headers: unauthenticated_header
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe '#PUT /api/projects/:project_id/activities/:id' do
    let!(:activity) { activities.sample }
    it 'should update a project activity' do
      activity.name = 'editado'
      put api_project_activity_path(
        id: activity.id,
        project_id: activity.project_id
      ), params: activity.to_json,
         headers: unauthenticated_header
      expect(response).to have_http_status(:ok)
    end
    it 'should throw error with invalid params' do
      activity.name = nil
      put api_project_activity_path(
        id: activity.id,
        project_id: activity.project_id
      ), params: activity.to_json,
         headers: unauthenticated_header
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe '#DELETE /api/projects/:project_id/activities/:id' do
    let!(:activity) { activities.sample }

    it 'should delete project activity' do
      delete api_project_activity_path(
        id: activity.id,
        project_id: activity.project_id
      ), headers: unauthenticated_header
      expect(response).to have_http_status(:no_content)
    end
  end
end
