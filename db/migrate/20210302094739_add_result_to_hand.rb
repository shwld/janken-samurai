class AddResultToHand < ActiveRecord::Migration[6.1]
  def change
    add_column :hands, :result, :string, default: :undefined
  end
end
