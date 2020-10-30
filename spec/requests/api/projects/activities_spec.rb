require 'rails_helper'


RSpec.describe Api::Projects::ActivitiesController, type: :request do
  let!(:project) { create(:project) }
  let!(:activities) { create_list(:activity, 10, project: project) }

end
