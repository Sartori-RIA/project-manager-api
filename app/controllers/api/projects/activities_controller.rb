# frozen_string_literal: true

module Api
  module Projects
    class ActivitiesController < ApplicationController
      load_resource

      def index
        render json: @activities
      end

      def show
        render json: @activity
      end

      def create
        @activity = Activity.new(activity_params)

        if @activity.save
          render json: @activity, status: :created
        else
          render json: @activity.errors, status: :unprocessable_entity
        end
      end

      def update
        if @activity.update(activity_params)
          render json: @activity
        else
          render json: @activity.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @activity.destroy
      end

      private

      def activity_params
        params.permit(:name,
                      :start_date,
                      :end_date,
                      :finished).merge(project_id: params[:project_id])
      end
    end
  end
end
