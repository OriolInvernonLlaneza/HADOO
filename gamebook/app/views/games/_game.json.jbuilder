json.extract! game, :id, :titulo, :sinopsis, :lanzamiento, :image_url, :created_at, :updated_at
json.url game_url(game, format: :json)
