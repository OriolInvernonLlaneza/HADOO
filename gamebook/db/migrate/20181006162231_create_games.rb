class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :titulo
      t.string :sinopsis
      t.date :lanzamiento
      t.string :image_url

      t.timestamps
    end
  end
end
