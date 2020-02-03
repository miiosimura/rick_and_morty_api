class Api::V1::CharactersController < ActionController::API
  def show
    character = response_character(params[:id])

    if character.status == 200
      name = find_name(character)
      first_episode_url = find_url_first_episode(character)
      episode = response_episode(first_episode_url)
      air_date = find_air_date(episode)
      
      render json: {
        name: name,
        air_date: air_date
      }, status: :ok
        
    elsif character.status == 404
      render json: character.body, status: :not_found
      
    elsif character.status == 500
      render json: character.body, status: :internal_server_error
        
    end
  end
  
  private
  def response_character(id)
    response = Faraday.get "https://rickandmortyapi.com/api/character/#{id}"
  end
  
  def find_name(character)
    name = JSON.parse(character.body)["name"]
  end

  def find_url_first_episode(character)
    episode = JSON.parse(character.body)["episode"].first
  end

  def response_episode(url)
    response_episode = Faraday.get url
  end

  def find_air_date(episode)
    air_date = JSON.parse(episode.body)["air_date"]
  end
end