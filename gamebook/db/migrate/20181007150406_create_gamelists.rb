class CreateGamelists < ActiveRecord::Migration[5.2]
  def change
    create_table :gamelists do |t|
      t.string :status, default: "Deseado"
    end
  end
end
