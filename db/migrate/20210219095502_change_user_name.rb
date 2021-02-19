class ChangeUserName < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :last_name
    rename_column :users, :first_name, :name
  end
end
