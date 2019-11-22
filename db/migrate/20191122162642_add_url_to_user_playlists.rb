class AddUrlToUserPlaylists < ActiveRecord::Migration[5.1]
  def change
    add_column :user_playlists, :url, :string
  end
end
