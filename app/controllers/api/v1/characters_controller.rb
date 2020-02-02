class Api::V1::CharactersController < ActionController::API
  def show
    id = params[:id]
    response_character = Faraday.get "https://rickandmortyapi.com/api/character/#{id}"

    if response_character.status == 200
      name = JSON.parse(response_character.body)["name"]
      episode = JSON.parse(response_character.body)["episode"].first
      
      response_episode = Faraday.get episode
      air_date = JSON.parse(response_episode.body)["air_date"]

      render json: {
        name: name,
        air_date: air_date
      }, status: :ok
    
    elsif response_character.status == 404
      render json: response_character.body, status: :not_found

    elsif response_character.status == 500
      render json: response_character.body, status: :internal_server_error

    end
  end
end