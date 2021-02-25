class CreateHands < ActiveRecord::Migration[6.1]
  def change
    create_table :hands, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :game, null: false, foreign_key: true, type: :uuid
      t.integer :choice

      t.timestamps
    end
  end
end
