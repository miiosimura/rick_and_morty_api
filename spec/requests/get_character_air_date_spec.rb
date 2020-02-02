require 'rails_helper'

describe 'Get character', type: :request do
  context 'show' do
    it 'return first air date' do
      id = 1

      get api_v1_character_path(id)
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:ok)
      expect(json[:name]).to eq("Rick Sanchez")
      expect(json[:air_date]).to eq("December 2, 2013")
    end

    it 'character not found' do
      id = 123456

      get api_v1_character_path(id)
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:not_found)
      expect(json[:error]).to eq("Character not found")
    end

    it 'parameter is not allowed' do
      id = 'abcde'

      get api_v1_character_path(id)
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:internal_server_error)
      expect(json[:error]).to eq("Hey! that parameter is not allowed, try with a number instead ;)")
    end
  end
end