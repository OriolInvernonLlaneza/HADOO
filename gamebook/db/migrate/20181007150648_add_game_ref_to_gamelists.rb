class AddGameRefToGamelists < ActiveRecord::Migration[5.2]
  def change
    add_reference :gamelists, :game, foreign_key: true
  end
end
