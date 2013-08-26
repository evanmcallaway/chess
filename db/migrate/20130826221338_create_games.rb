class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.text :pgn
      t.references :user
      t.timestamps
    end
  end
end
