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
      
      expect(json_response['sectors'][0]['name']).to eq(sector['name'])
      expect(json_response['plants'][0]['id']).to eq(plant1['id'])
    end
  end

  describe 'GET show' do
    it 'returns a sector with its plants' do
      sector = create(:sector)
      plant1 = create(:plant, sector_id: sector.id)
      plant2 = create(:plant, sector_id: sector.id)

      get :show, params: { id: sector.id }

      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)
      
      expect(json_response['plants'].length).to eq(2)
      expect(json_response['plants'].first['id']).to eq(plant1.id)
      expect(json_response['plants'].second['id']).to eq(plant2.id)
    
    end
  end
end
