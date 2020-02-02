require 'rails_helper'

describe 'Get character air date', type: :request do
  context 'show' do
    it 'return character first air date show' do
      id = 1

      get api_v1_character_first_air_date_path(id)
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:ok)
      expect(json[:name]).to eq("Rick Sanchez")
      expect(json[:air_date]).to eq("December 2, 2013")
    end
  end
end