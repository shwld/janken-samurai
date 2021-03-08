class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references :room, type: :uuid, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
