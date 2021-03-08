class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games, id: :uuid do |t|
      t.references :room, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
