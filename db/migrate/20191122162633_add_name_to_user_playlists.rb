class AddNameToUserPlaylists < ActiveRecord::Migration[5.1]
  def change
    add_column :user_playlists, :name, :string
  end
end
