require 'net/http'
require 'json'
require 'igdb_client'

class Game < ApplicationRecord
  has_many :gamelists
  has_many :users, through: :gamelists
  has_many :comments

  def self.get_few_games_igdb
    Game.get_games_igdb
    offset = 1
    while offset<20
      Game.get_games_igdb(offset)
      offset +=1
    end

  end

  def self.get_games_igdb (offset = nil)
    IGDB::API.api_key = '91f4c2721e1ed2d07038da3bf79d498b'
    if offset.nil?
      games = IGDB::API.games({"filter[rating][gt]" => "85", "filter[first_release_date][gt]" => "1507317937000", "filter[release_dates.platform][any]" => "48,49,12,9", fields: "name,summary,first_release_date,cover", order: "first_release_date:desc", limit: 50})
    else
      games = IGDB::API.games({"filter[rating][gt]" => "85", "filter[first_release_date][gt]" => "1286391913000", "filter[release_dates.platform][any]" => "48,49,12,9", fields: "name,summary,first_release_date,cover", order: "first_release_date:desc", limit: 50, offset: offset})
    end
    games.each do |g|
      Game.create(titulo: g.name, sinopsis: g.summary, lanzamiento: Date.strptime((g.first_release_date / 1000).to_s, '%s'), image_url: "https://images.igdb.com/igdb/image/upload/t_cover_big/#{g.cover.cloudinary_id}.jpg")
    end
    return games
  end

end
