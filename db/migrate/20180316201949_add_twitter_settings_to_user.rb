class AddTwitterSettingsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :twitter_id, :string, null: true
    add_column :users, :twitter_token, :string, null: true
  end
end
