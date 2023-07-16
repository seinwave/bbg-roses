require 'rails_helper'

RSpec.describe MapController, type: :controller do
  describe 'GET index' do
    it 'returns all sectors and plants' do
      sector = create(:sector)
      plant1 = create(:plant, sector_id: sector.id)
      plant2 = create(:plant, sector_id: sector.id)

      get :index

      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)
      expect(json_response['sectors'][0]).to eq(sector)
      expect(json_response['plants']).to contain_exactly(plant1, plant2)
    end
  end

  describe 'GET show' do
    it 'returns a sector with its plants' do
      sector = create(:sector)
      plant1 = create(:plant, sector: sector)
      plant2 = create(:plant, sector: sector)

      get :show, params: { id: sector.id }

      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)
      expect(json_response['sector']).to eq(sector)
      expect(json_response['plants']).to contain_exactly(plant1, plant2)
    end
  end
end
