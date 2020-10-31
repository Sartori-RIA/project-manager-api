# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::ProjectsController, type: :request do
  let!(:projects) { create_list(:project, 10) }

  describe '#GET /api/projects' do
    it 'should request all projects' do
      get api_projects_path, headers: unauthenticated_header
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#GET /api/projects/:id' do
    it 'should request project by id' do
      get api_project_path(projects.sample.id), headers: unauthenticated_header
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#GET /api/projects/search' do
    it 'should search projects' do
      project = projects.sample
      get search_api_projects_path,
          params: { q: project.name },
          headers: unauthenticated_header
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(project.to_json)
    end
  end

  describe '#POST /api/projects' do
    it 'should create a project' do
      attributes = attributes_for(:project)
      post api_projects_path,
           params: attributes.to_json,
           headers: unauthenticated_header
      expect(response).to have_http_status(:created)
    end
    it 'should throw error with invalid params' do
      post api_projects_path,
           params: {},
           headers: unauthenticated_header
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe '#PUT /api/projects/:id' do
    let!(:project) { projects.sample }
    it 'should update a project' do
      project.name = 'editado'
      put api_project_path(project.id), params: project.to_json, headers: unauthenticated_header
      expect(response).to have_http_status(:ok)
    end
    it 'should trow unprocessable entity status' do
      project.name = ''
      put api_project_path(project.id), params: project.to_json, headers: unauthenticated_header
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe '#DELETE /api/projects/:id' do
    let!(:project) { projects.sample }
    it 'should delete project' do
      delete api_project_path(project.id), headers: unauthenticated_header
      expect(response).to have_http_status(:no_content)
    end
  end
end
