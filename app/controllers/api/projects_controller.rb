# frozen_string_literal: true

module Api
  class ProjectsController < ApplicationController
    load_resource

    def index
      paginate json: @projects.order(name: :asc)
    end

    def show
      render json: @project
    end

    def search
      @projects = Project.search params[:q]
      render json: @projects.order(name: :asc)
    end

    def create
      @project = Project.new(project_params)

      if @project.save
        render json: @project, status: :created
      else
        render json: @project.errors, status: :unprocessable_entity
      end
    end

    def update
      if @project.update(project_params)
        render json: @project
      else
        render json: @project.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @project.destroy
    end

    private

    def project_params
      params.permit(:name,
                    :start_date,
                    :end_date)
    end
  end
end
