# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'PlantStatuses', type: :request do
  describe 'GET /plant_statuses' do
    it 'should show all statuses' do
      get '/plant_statuses'
      expect(response).to have_http_status(:success)
      expect(response.body).to include('PLANT STATUSES')
    end

    it 'should show a specific status' do
      status = PlantStatus.new
      status.status = 0
      status.plant_id = 1
      status.save
      expect(status.save).to eq(true)
      get "/plant_statuses/#{status.id}"
      expect(response).to have_http_status(:success)
      expect(response.body).to include('peak')
    end
  end
end

# CREATING A NEW PLANT STATUS
describe 'POST /plant_statuses' do
  context 'with valid attributes' do
    parameters = { plant_status: { status: 'peak', plant_id: 1 } }
    it 'should create a new status, with valid parameters' do
      post '/plant_statuses', params: parameters
      expect(PlantStatus.last.status).to eq('peak')
    end
    it 'should redirect to the newly created status' do
      post '/plant_statuses', params: parameters
      expect(response).to redirect_to(PlantStatus.last)
    end
  end

  context 'with invalid attributes' do
    parameters = { plant_status: { status: 'peak' } }
    it 'raises an error, with invalid parameters' do
      expect do
        post '/plant_statuses', params: parameters
      end.not_to change(PlantStatus, :count)
    end
    it 'redirects to the error page' do
      post '/plant_statuses', params: parameters
      expect(response.body).to include("didn't work")
    end
  end
end

# UPDATING A PLANT STATUS
describe 'PUT /plant_statuses' do
  it 'should update a selected status' do
    status = PlantStatus.new
    status.status = 0
    status.plant_id = 1
    status.save
    get "/plant_statuses/#{status.id}/edit"
    expect(response.body).to include('editing')
  end
end

# DELETING A PLANT_STATUS
describe 'DELETE /plant_statuses' do
  it 'should delete a status' do
    status = PlantStatus.new
    status.status = 0
    status.plant_id = 1
    status.save
    delete "/plant_statuses/#{status.id}"
    expect { PlantStatus.find(status.id) }.to raise_error(ActiveRecord::RecordNotFound)
  end
end
