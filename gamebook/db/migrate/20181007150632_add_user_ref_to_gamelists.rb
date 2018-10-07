class AddUserRefToGamelists < ActiveRecord::Migration[5.2]
  def change
    add_reference :gamelists, :user, foreign_key: true, index: { unique: true }
  end
end
